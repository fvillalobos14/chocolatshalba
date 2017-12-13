class DocumentsController < ApplicationController
  before_action :authenticate_user!
  def new
    @entry = EntryControl.find(params[:entry_control_id])
    @document = @entry.documents.build
  end

  def create
    entry = EntryControl.find(params[:entry_control_id])
    document = entry.documents.build(document_params)

    if document.save
      redirect_to entry, notice: "Documento agregado con éxito"
    else
      flash[:errors] = "No se pudo adjuntar el documento"
      render :new
    end
  end

  def edit
    @document=Document.find(params[:id])
  end

  def update
    document=Document.find(params[:id])
    if document.update(document_params)
      redirect_to document.entry_control
    else
      render 'edit'
    end
  end

  def document_params
    params.require(:document).permit(:title,:ec_data)
  end
end
