class InvoicesController < ApplicationController
    def index
        @invoices = Invoice.where(paid: false)
    end

    def update
        invoice = Invoice.find(params[:id])
        if invoice.update(paid: true)
            redirect_to invoices_path
        end
    end
end
