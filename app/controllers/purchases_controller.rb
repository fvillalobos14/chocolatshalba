class PurchasesController < ApplicationController
  def index
    @batches = Batch.all
  end

  def new
    @batch = Batch.find(params[:batch_id])
    @purchase = @batch.build_purchase
  end

  def create
    @batch = Batch.find(params[:batch_id])
    @purchase = @batch.build_purchase(purchase_params)
    if @purchase.save
      @notification = Notification.where("kind = 5").first
      @notification.destroy
      createNotification
      redirect_to purchases_index_path
    end
  end

  def createNotification
    @notification = Notification.create(read: false, kind: 3)
    @notification.save
  end

  private
    def purchase_params
      params.require(:purchase).permit(:decision)
    end
end
