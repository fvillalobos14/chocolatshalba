class InventoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @entries = EntryControl.search(params[:searchbox].to_s, params[:from].to_s,params[:to].to_s)
    @batchesEAHT = Batch.where(cocoaType: 1)
    @batchesEBHT = Batch.where(cocoaType: 2)
    @batchesECHT = Batch.where(cocoaType: 3)
    @batchesCE = Batch.where(certificatetype: 1)
    @batchesCT= Batch.where(certificatetype: 2)
    @batchesCC = Batch.where(certificatetype: 3)
    @batchesIA = Batch.where(geneticMaterial: 2)
    @batchesHT = Batch.where(geneticMaterial: 1)
    part1 = request.original_url.to_s.split("?")[0]
    part2 = request.original_url.to_s.split("?")[1]
    @new_url = part1 + ".pdf"
    if part2 != nil
      @new_url = @new_url + "?" + part2
    end
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "Reporte_Inventario.pdf",:template => "inventories/pdf.html.erb"
      end
      
    end
  end

end
