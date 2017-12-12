class StaticPagesController < ApplicationController
	before_action :authenticate_user!
	def dashboard
	end

	def stages
		@batches = Batch.all
	end

	def traceability
		@batches = Batch.all
	end

	def quality_info
		batch_id = params[:lote].to_i
		@batch = Batch.find(batch_id)
		@qualityControl = @batch.quality_control
	end
end
