class QualityControlsController < ApplicationController
  before_action :authenticate_user!
  def index
    #@entries = EntryControl.all
    @sorted = false
    @organizations = Organization.all
    @batches = Batch.all
    @entries = EntryControl.search(params[:searchbox].to_s, "", "")  
    @batchesFilters = []
    @allBatches = []
    @filteredBatches= []
    searchBatches(params[:purchase].to_s, params[:hoja].to_s)
    find_dups()
  end

  def new
    @batch = Batch.find(params[:batch_id])
    @qualityControl = @batch.build_quality_control
  end

  def create
    batch = Batch.find(params[:batch_id])
    qualityControl = batch.build_quality_control(quality_params)
    entry = EntryControl.find(batch.entry_control_id)
    if qualityControl.save
        params["results"].each do |result|
          Result.create(:batch_id => batch.id, :parameter_id => result["parameter_id"], :run => result["run"], :score => result["score"])
        end
        calidad = batch.defineResult()
        if calidad != "A"
          notification = Notification.where(kind: 1, read: false).first
          notification.update(read: true)
          notification.save
        end
        if not batch.sensory_analysis.nil?
          notification = Notification.where(kind: 1, read: false).first
          notification.update(read: true)
          notification.save
          batch.review=1
          batch.save
        end
        batch.updateState()
        redirect_to entry
    else
        redirect_to "/batches/"+batch.id.to_s+"/quality_controls/new"
    end
  end

  def edit
    @quality_control=QualityControl.find(params[:id])
    @batch=@quality_control.batch
  end

  def update
    quality_control=QualityControl.find(params[:id])
    batch=quality_control.batch
    if quality_control.update(quality_params_update)
      ##params["results"].each do |result|
      ##  r=Result.where(:batch_id => batch.id, :parameter_id => result["parameter_id"], :run => result["run"]).first
      ##  r.score=result["score"]
      ##  r.save
      ##end
      redirect_to quality_control
    else
      render 'edit'
    end
  end

  def show
    @qualityControl=QualityControl.find(params[:id])
    @batch=Batch.find(@qualityControl.batch.id)
    @new_quality = CocoaType.where("id = ?",@batch.cocoaType).first.name
    @data =  dataChart(@batch.id)
  end

  private
  def quality_params
    params.require(:quality_control).permit(:code, :final_code, :cut_at, :f_harvest, :s_harvest, :trinitary, :outsider, :observation, :made_by, :samples)
  end

  def quality_params_update
    params.require(:quality_control).permit(:observation)
  end

  def createNotification(batch)
    batch=Batch.find(batch.id)
    notification = Notification.create(read: false, kind: 2)
    notification.save
    if batch.ft 
      notification1 = Notification.create(read: false, kind: 4)
      notification1.save
    end 
  end

  def dataValues(batch)
    batch=Batch.find(batch)
    data = []
    puts "Arriba de categoryaaaaaaaaaaaaaa"
    Category.all.order(:place).each do |category| #La categoria del analisis fidsico Ex: ("Contenido de agua")
    #  puts"cat"
     # puts category.inspect
      category.parameters.order(:place).each do |parameter| #Los parametros de la categoria Ex: ("Humedad del grano")
       # puts "par"
       # puts parameter.inspect
       puts "Acceptance"
       puts parameter.acceptance.inspect
        #if parameter.acceptance == nil
          puts "Place"
          puts parameter.category.place.inspect
          if parameter.category.place == 4  #--Si no esta bien fermentado
            puts "category Run"
            puts category.runs
            if category.runs >= 1
              value = Result.where(parameter_id: parameter.id, batch_id: @batch.id).sum(:score)/3
              puts "VALUEEEEEEEEEEEEEE"
              puts value
              data.append(value)
            end
          end
        #end
      end
    end
    puts "analisaaaaaaaaar dataaaaaaaaaaaaaa"
    puts data.inspect
    puts" terminooooooooooooooooooooo"
    return data
  end

  def dataChart(batch)
    dataname = []
    paramaterPlace = Parameter.all
    for parama in paramaterPlace
      if parama.category.place == 4
        dataname.append(parama.name)
      end
    end
    datavalues = dataValues(batch)
    data = {
        labels: dataname,
        datasets: [
            {
                label: "Sensorial",
                borderColor: "rgba(50, 189, 158, 1)",
                backgroundColor: "rgba(50, 189, 158, 0.5)",
                data: datavalues
            }
        ]
    }
    return data
  end

  def searchBatches(sortedIsCheck, entryNumber)
    @entries.each do |entry|
      entry.batches.each do |batch|
        
        puts entryNumber.inspect
        
          @batchesFilters.push(batch)
        

        end
    end

    if(sortedIsCheck == "on")
     order_array = @batchesFilters.sort_by { |batch| batch.entry_control.entry_number}
     @batchesFilters = order_array
     @sorted = true
    end

  end

  def find_dups()
    contador=0   
    verify=false
      @batches.each do |batch|           
           @allBatches.push(batch)
             if (contador==0)
               @filteredBatches.push(batch)
                end
       contador=1
       end     
       array=@filteredBatches
       puts @allBatches   
        @allBatches.each do |batch|
        @filteredBatches.each do |fbatch|         
          if (batch.entry_control.organization.name == fbatch.entry_control.organization.name && batch.entry_control.entry_number == fbatch.entry_control.entry_number)                              
          verify=true
          break;       
          end
       end
       if(verify==false)
       array.push(batch) 
       else
        verify=false
       end
      end
      @filteredBatches=array  
     
 end


  
end

