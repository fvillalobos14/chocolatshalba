class FilechecklistsController < ApplicationController
  before_action :authenticate_user!
  after_action :set_everything, only: [:edit, :update]
  
  def new
    @entry = EntryControl.find(params[:entry_control_id])
    @checklist = @entry.filechecklists.build
  end

  def create
    entry = EntryControl.find(params[:entry_control_id])
    checklist = entry.filechecklists.build(checklist_params)
    checklist.everything= false
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
      if current_user.certification_role
        flash[:notice] = "Guardado"
      else
        redirect_to checklist.entry_control, notice: "Guardado con éxito"
      end
    else
      render 'edit'
    end
  end
  
  def show
    @checklist = Filechecklist.find(params[:id])
  end

  def set_everything
    @checklist = Filechecklist.find(params[:id])
    if @checklist.referralSheet & @checklist.inspectionSheet & @checklist.embacingControl & @checklist.producersList & @checklist.collectionCleaningControl & @checklist.warehouseEntrySheet & @checklist.billCopy
      @checklist.everything= true
    else
      @checklist.everything= false
    end
    @checklist.save
  end

  def checklist_params
    params.require(:filechecklist).permit(:referralSheet, :producersList, :inspectionSheet, :embacingControl, :collectionCleaningControl, :warehouseEntrySheet, :billCopy)
  end
end
