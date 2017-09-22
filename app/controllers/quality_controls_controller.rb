class QualityControlsController < ApplicationController
  def index
    @notification = Notification.where(kind: 1)
    @entries=EntryControl.all
  end

  def new
  	@batch=Batch.find(params[:batch_id])
  	@qualityControl=@batch.build_quality_control
    @Acceptances = Acceptance.all
  end

  def create
    @batch=Batch.find(params[:batch_id])
    @qualityControl=@batch.build_quality_control(quality_params)
    @entry=EntryControl.find(@batch.entry_control_id)

    if @qualityControl.save
        params["results"].each do |result|
          Result.create(:quality_control_id => @qualityControl.id, :parameter_id => result["parameter_id"], :run => result["run"], :score => result["score"])
        end
        @notification = Notification.where("kind = 1").first
        @notification.destroy
        createNotification
        redirect_to @entry
    else
        redirect_to "/batches/"+@batch.id.to_s+"/quality_controls/new"
    end
  end

  def show
    @qualityControl=QualityControl.find(params[:id])
    @new_quality = defineResult(@qualityControl.id)
    @data =  dataChart(@qualityControl.id)
    @revisions = Revision.all
  end

  private
  def quality_params
    params.require(:quality_control).permit(:code, :final_code, :cut_at, :f_harvest, :s_harvest, :trinitary, :outsider, :observation, :made_by)
  end

  def defineResult(quality)
    @qualityControl=QualityControl.find(quality)
    current_quality = "A"
    Category.all.order(:place).each do |category|
      category.parameters.order(:place).each do |parameter|
        value = -1
        if parameter.acceptance != nil
          if category.runs > 1
            value = Result.where(parameter_id: parameter.id, quality_control_id: @qualityControl.id).sum(:score)/3
          else
            value = Result.where(parameter_id: parameter.id, quality_control_id: @qualityControl.id, run: 1).first.score
          end
          #------------------------
          if current_quality == "A"
              if parameter.acceptance.min_qualityA == -1
                if parameter.acceptance.max_qualityA < value
                  current_quality = "B"
                end
              elsif parameter.acceptance.max_qualityA == -1
                if parameter.acceptance.min_qualityA > value
                  current_quality = "B"
                end
              end
          end
          #-------------------------
          if current_quality == "B"
              if parameter.acceptance.min_qualityB == -1
                if parameter.acceptance.max_qualityB < value
                  current_quality = "C"
                end
              elsif parameter.acceptance.max_qualityB == -1
                if parameter.acceptance.min_qualityB > value
                  current_quality = "C"
                end
              end
          end
          #---------------------------
          if current_quality == "C"
              if parameter.acceptance.min_qualityC == -1
                if parameter.acceptance.max_qualityC < value
                  current_quality = "D"
                  break
                end
              elsif parameter.acceptance.max_qualityC == -1
                if parameter.acceptance.min_qualityC > value
                  current_quality = "D"
                  break
                end
              end
          end
        end
      end
      if current_quality == "D"
        break
      end
    end
    return current_quality
  end

  def createNotification
    @notification = Notification.create(read: false, kind: 2)
    @notification.save
  end

  def dataValues(quality)
    @qualityControl=QualityControl.find(quality)
    data = []
    Category.all.order(:place).each do |category|
      category.parameters.order(:place).each do |parameter|
        if parameter.acceptance == nil
          if parameter.category.place = 4
            if category.runs = 1
              value = Result.where(parameter_id: parameter.id, quality_control_id: @qualityControl.id, run: 1).first.score
              data.append(value)
            end
          end
        end
      end
    end
    return data
  end

  def dataChart(quality)
    @qualityControl=QualityControl.find(quality)
    dataname = []
    paramaterPlace = Parameter.all
    for parama in paramaterPlace
      if parama.category.place == 4
        dataname.append(parama.name)
      end
    end
    datavalues = dataValues(quality)
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
