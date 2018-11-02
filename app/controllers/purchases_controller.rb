class PurchasesController < ApplicationController
  before_action :authenticate_user!
  def index
    @batches = Batch.all
  end

  def new
    @batch = Batch.find(params[:batch_id])
    @purchase = @batch.build_purchase
  end

  def create
    batch = Batch.find(params[:batch_id])
    purchase = batch.build_purchase(purchase_params)
    if purchase.decision==0
      batch.purchase =nil
      batch.buy=1
    end
    if purchase.save
      if purchase.decision == 1
        invoice = Invoice.create(paid: false, batch_id: batch.id)
        invoice.save
        createNotification
      end
      notification = Notification.where(kind: 5, read: false).first
      notification.update(read: true)
      notification.save
      redirect_to purchases_index_path
    end
  end

  def createNotification
    notification = Notification.create(read: false, kind: 3)
    notification.save
  end

  private
    def purchase_params
      params.require(:purchase).permit(:decision)
    end
end
