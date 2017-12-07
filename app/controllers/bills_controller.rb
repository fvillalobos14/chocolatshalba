class BillsController < ApplicationController
  def index
    @bills = Bill.all
  end

  def show
    @bill = Bill.find(params[:id])
  end

  def new
    @invoice = Invoice.find(params[:invoice_id])
    @bill = @invoice.bills.build
  end

  def create
    @invoice = Invoice.find(params[:invoice_id])
    @bill = @invoice.bills.build(bill_params)

    if @bill.save
      redirect_to invoices_path, notice: "Factura agregado con exito"
    else
      flash[:errors] = "No se pudo adjuntar la factura"
      render :new
    end
  end

  def destroy
    @invoice = Invoice.find(params[:invoice_id])
    @bill = Invoice.bills.find(params[:id])
    @bill.destroy
    redirect_to @invoice, notice: "Documento eliminado con exito"
  end

  def bill_params
    params.require(:bill).permit(:code,:invoice_doc)
  end
end
