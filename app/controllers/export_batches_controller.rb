class ExportBatchesController < ApplicationController
  before_action :authenticate_user!
  def join
  end

  def new
    @batches=Batch.where(id: params[:batches])
    @results=Array.new(Parameter.maximum(:id), 0)

    @batches.each do |batch|
      Category.all.order(:place).each do |category|
        category.parameters.order(:place).each do |parameter|
          if category.runs > 1
            @results[parameter.id-1]+=Result.where(parameter_id: parameter.id, batch_id: batch.id).sum(:score)*batch.weight/@batches.sum(:weight)/3
          else
            @results[parameter.id-1]+=Result.where(parameter_id: parameter.id, batch_id: batch.id, run: 1).first.score
          end
        end
      end
    end
  end

  def create
    export_batch=ExportBatch.create
    batches=Batch.where(id: params[:batches])
    batches.each do |batch|
      batch.export_batch_id=export_batch.id
      batch.save
    end
    redirect_to export_batches_join_path
  end
end

