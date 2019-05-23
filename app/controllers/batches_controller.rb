class BatchesController < ApplicationController
  before_action :authenticate_user!
  def new
    @cocoa = CocoaType.all
    @certificate = CertificateType.all
    @genetic = GeneticMaterial.all
  	@entryControl = EntryControl.find(params[:entry_control_id])
    @batch=@entryControl.batches.build
  end
  
  def batch
    @batches = Batch.all
  end

  def create
    entryControl = EntryControl.find(params[:entry_control_id])
    batch=entryControl.batches.build(batches_params)
    batch.enterCode= "k"
    batch.state = "Rec. Ingresado"
    if batch.save
        createNotification#soy genial
        redirect_to entryControl
    else
        redirect_to "/entry_controls/"+entryControl.id.to_s+"/batches/new"
    end
  end

  def edit
    @batch=Batch.find(params[:id])
  end

  def update
    
    batch=Batch.find(params[:id])
    if batch.update(batches_params)
      if current_user.warehouse_role || current_user.admin_role
        # session[:return_to] ||= request.referer.referer
        # redirect_to (:back)
        redirect_to "/entry_controls/"+batch.entry_control.id.to_s
      elsif current_user.quality_role
        redirect_to "/batches/"+batch.id.to_s+"/sensory_analyses/new"
      end
    else
      render 'edit'
    end
  end

  def moveBatches
    @batches = Batch.where(moved: false)
  end

  def move_batch
    batch = Batch.find(params[:id])
    if batch.update(moved: true)
      notification = Notification.where(kind: 3, read: false).first
      notification.update(read: true)
      notification.save
      redirect_to batches_moveBatches_path
    end
  end

  def show
    @batch = Batch.find(params[:id])
  end

  def destroy
    batch=Batch.find(params[:id])
    ec_id = batch.entry_control.id.to_s
    if QualityControl.where(batch_id: batch.id).blank? || SensoryAnalysis.where(batch_id: batch.id).blank?
      notification = Notification.where(read: false).first
      notification.update(read: true)
      notification.save
    end
    batch.destroy
    redirect_to "/entry_controls/"+batch.entry_control.id.to_s
  end

  private
  def batches_params
    params.require(:batch).permit(:sackAmount, :weight, :enterCode, :certificatetype, :postharvestCenter, :cocoaType,
                                  :geneticMaterial, :ft, :samples, :beans, :state)
  end

  def createNotification
    notification = Notification.create(read: false, kind: 1)
    notification.save
  end
end
