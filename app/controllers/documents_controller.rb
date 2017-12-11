class DocumentsController < ApplicationController

  def new
    @entry = EntryControl.find(params[:entry_control_id])
    @document = @entry.documents.build
  end

  def create
    @entry = EntryControl.find(params[:entry_control_id])
    @document = @entry.documents.build(document_params)

    if @document.save
      redirect_to @entry, notice: "Documento agregado con exito"
    else
      flash[:errors] = "No se pudo adjuntar el documento"
      render :new
    end
  end

  def document_params
    params.require(:document).permit(:title,:ec_data)
  end
end
