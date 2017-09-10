class QualityControlsController < ApplicationController
  def index
    @notification = Notification.all
    @notification.delete_all

    @entries=EntryControl.all
  end

  def new
  	@batch=Batch.find(params[:batch_id])
  	@qualityControl=@batch.build_quality_control
  end

  def create
    @batch=Batch.find(params[:batch_id])
    @qualityControl=@batch.build_quality_control(quality_params)
    @entry=EntryControl.find(@batch.entry_control_id)

    
    if @qualityControl.save
        params["results"].each do |result|
          Result.create(:quality_control_id => @qualityControl.id, :parameter_id => result["parameter_id"], :run => result["run"], :score => result["score"])
        end
        redirect_to @entry
    else
        redirect_to :new
    end    
  end

  private
  def quality_params
    params.require(:quality_control).permit!
  end  
end
