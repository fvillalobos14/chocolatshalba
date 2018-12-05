class InventoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @entries = EntryControl.search(params[:searchbox].to_s, params[:from].to_s,params[:to].to_s)
    @batchesFilters = []
    searchBatches(params[:quality],params[:certificate],params[:variety],params[:ft],params[:state],params[:purchase])
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
    endputs batch.cocoaType
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "Reporte_Inventario.pdf",:template => "inventories/pdf.html.erb"
      end
      
    end
  end
  
  def searchBatches(cocoaType,certificateType,geneticMaterial,ft,state,buy)
    @entries.each do |entry|
      entry.batches.each do |batch|
        if batch.cocoaType == cocoaType && batch.certificatetype == certificateType && batch.geneticMaterial == geneticMaterial && batch.ft == ft && batch.state == state && batch.buy == buy
          @batchesFilters.push(batch)
        end
      end
    end
    puts @batchesFilters.size

  end

end
