require 'def_result'
class EntryControlsController < ApplicationController
  before_action :authenticate_user!
  include DefineResult

  def new
    @organization = Organization.find(params[:searchbox])
    @entryControl = @organization.entry_controls.build
  end

  def create
    organization = Organization.find(params[:organization_id])
    entryControl = organization.entry_controls.build(entryControl_params)

    if entryControl.save
        redirect_to entryControl
    else
        redirect_to '/organizations/'+organization.id.to_s+'/entry_controls/new'
    end
  end

  def show
    @entry = EntryControl.find(params[:id])
    @batches = @entry.batches
    if current_user.quality_role
      @qc_results = {}
      @batches.each do |batch|
        if not QualityControl.where(batch_id: batch.id).blank?
          @qc_results[batch.id] = CocoaType.where("id = ?",batch.cocoaType).first.name
        end
      end  
    end
  end

  def index
    @organization = Organization.find(params[:searchbox])
    @entryControl = @organization.entry_controls.build

  end


  private
  def entryControl_params
    params.require(:entry_control).permit(:entryDate, :exchangeRate, :receivedBy, :deliveredBy,:entry_number)
  end
end
