class BatchesController < ApplicationController
  before_action :authenticate_user!
  def new
    @cocoa = CocoaType.all
    @genetic = GeneticMaterial.all
  	@entryControl=EntryControl.find(params[:entry_control_id])
  	@batch=@entryControl.batches.build
  end

  def create
    @entryControl=EntryControl.find(params[:entry_control_id])
    @batch=@entryControl.batches.build(batches_params)

    if @batch.save
        createNotification
        redirect_to @entryControl
    else
        redirect_to "/entry_controls/"+@entryControl.id.to_s+"/batches/new"
    end
  end

  def moveBatches
    @batches=Batch.where(moved: false)
  end

  def update
    @batch=Batch.find(params[:id])
    if @batch.update(moved: true)
      @notification = Notification.where("kind = 3").first
      @notification.destroy
      redirect_to batches_moveBatches_path
    end
  end

  def show
  end

  private
  def batches_params
    params.require(:batch).permit(:sackAmount, :weight, :enterCode, :cocoaType, :geneticMaterial)
  end

  def createNotification
    @notification = Notification.create(read: false, kind: 1)
    @notification.save
  end
end
