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
        redirect_to @entryControl
    else
        redirect_to :new    
    end    
  end  

  def show
  end

  private
  def batches_params
    params.require(:batch).permit(:sackAmount, :weight, :enterCode, :cocoaType, :geneticMaterial)
  end  
end
