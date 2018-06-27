class BarcodesController < ApplicationController
    before_action :authenticate_user!
    def new
        @batch=Batch.find(params[:batch_id])
    end

    # def show
    #    @batch = Batch.find(params[:id])
    # end
end
