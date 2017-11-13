class PurchasesController < ApplicationController
  def index
    @batches = Batch.all
  end

  def new
    @batch = Batch.find(params[:batch_id])
    @purchase = @batch.build_purchase
  end

  def create
    @batch=Batch.find(params[:batch_id])
    @purchase=@batch.build_purchase(purchase_params)
    if @purchase.save
      redirect_to purchases_index_path
    end
  end

  private
    def purchase_params
      params.require(:purchase).permit(:decision)
    end
end
