class FilechecklistsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @entry = EntryControl.find(params[:entry_control_id])
    @checklist = @entry.filechecklists.build
  end

  def create
    entry = EntryControl.find(params[:entry_control_id])
    checklist = entry.filechecklists.build(checklist_params)
    
    if checklist.save
      redirect_to entry, notice: "Guardado con éxito"
    else
      flash[:errors] = "No se pudo guardar"
      render :new
    end
  end

  def edit
    @checklist = Filechecklist.find(params[:id])
  end

  def update
    checklist = Filechecklist.find(params[:id])
    if checklist.update(checklist_params)
      redirect_to checklist.entry_control
    else
      render 'edit'
    end
  end
  
  def checklist_params
    params.require(:filechecklist).permit(:referralSheet, :producersList, :inspectionSheet, :embacingControl, :collectionCleaningControl, :warehouseEntrySheet)
  end
end
