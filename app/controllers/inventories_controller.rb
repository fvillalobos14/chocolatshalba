class InventoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @entries = EntryControl.search(params[:searchbox].to_s, params[:from].to_s,params[:to].to_s)
    @batchesFilters = []
    searchBatches(params[:quality].to_i,params[:certificate].to_i,params[:variety].to_i,params[:ft].to_s,params[:state].to_s,params[:purchase].to_i)
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
  
  def searchBatches(cocoaType,certificateType,geneticMaterial,ft,state,buy)
    @entries.each do |entry|
      entry.batches.each do |batch|
        if cocoaType != 0 
          if batch.cocoaType != cocoaType
            next
          end
        end
        if certificateType != 0
          if batch.certificatetype != certificateType
            next
          end
        end
        if geneticMaterial != 0
          if batch.geneticMaterial != geneticMaterial
            next
          end
        end 
        if ft != ""
          chec = ft == "true"?true:false
          if batch.ft != chec
            next
          end
        end
        if state != "" 
          if batch.state != state
            next
          end
        end
        if buy != 0
          if batch.buy != buy
            next
          end
        end
        @batchesFilters.push(batch)
      end
    end

  end

end
