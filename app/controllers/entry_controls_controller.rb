class EntryControlsController < ApplicationController
  def new
    @organization = Organization.find(params[:organization_id])
  	@entryControl= @organization.entry_controls.build
  end

  def create
    @organization = Organization.find(params[:organization_id])
    @entryControl= @organization.entry_controls.build(entryControl_params)
    
    if @entryControl.save
        redirect_to @entryControl
    else
        redirect_to :new    
    end    
  end    

  def show
    @entry = EntryControl.find(params[:id])
  end

  private
  def entryControl_params
    params.require(:entry_control).permit(:entryDate, :exchangeRate, :receivedBy, :deliveredBy)
  end  
end
