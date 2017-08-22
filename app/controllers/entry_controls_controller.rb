class EntryControlsController < ApplicationController
  def new
  	@entryControl=EntryControl.new
  end

  def create
    @entryControl = EntryControl.new(entryControl_params)

    if @entryControl.save
        redirect_to @entryControl
    else
        redirect_to :new    
    end    
  end    

  def show
  end

  private
  def entryControl_params
    params.require(:entryControl).permit(:organization_id, :entryDate, :exchangeRate, :receivedBy, :deliveredBy)
  end  
end
