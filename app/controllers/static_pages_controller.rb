class StaticPagesController < ApplicationController
	before_action :authenticate_user!
	def dashboard
	end

	def stages
		@batches = Batch.all
	end
end
