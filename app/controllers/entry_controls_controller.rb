class EntryControlsController < ApplicationController
  before_action :authenticate_user!
  def new
    @organization=Organization.find(params[:organization_id])
  	@entryControl=@organization.entry_controls.build
  end

  def create
    @organization=Organization.find(params[:organization_id])
    @entryControl=@organization.entry_controls.build(entryControl_params)
    
    if @entryControl.save
        createNotification
        redirect_to @entryControl
    else
        redirect_to :new    
    end    
  end    

  def show
    @entry=EntryControl.find(params[:id])
    @batches=@entry.batches
  end

  private
  def entryControl_params
    params.require(:entry_control).permit(:entryDate, :exchangeRate, :receivedBy, :deliveredBy, :ec_files)
  end
  
  def createNotification
    @notification = Notification.create(read: false)
    @notification.save
  end  
end
