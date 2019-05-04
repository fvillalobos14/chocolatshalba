class QualityControlsController < ApplicationController
  before_action :authenticate_user!
  def index
    @entries = EntryControl.all
    @batches = Batch.all
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
    Category.all.order(:place).each do |category|
      category.parameters.order(:place).each do |parameter|
        if parameter.acceptance == nil
          if parameter.category.place = 4
            if category.runs >= 1
              value = Result.where(parameter_id: parameter.id, batch_id: @batch.id).sum(:score)/3
              data.append(value)
            end
          end
        end
      end
    end
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
end
