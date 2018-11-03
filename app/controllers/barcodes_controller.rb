class BarcodesController < ApplicationController
    before_action :authenticate_user!
    def new
        require 'barby'
        require 'barby/barcode/code_128'
        require 'barby/outputter/png_outputter'
        @batch=Batch.find(params[:batch_id])
        bc39 = Barby::Code128B.new(@batch.enterCode)
        @image = bc39.to_png
        puts Rails.application.assets.paths[1]
        File.open(Rails.application.assets.paths[1]+'/barcode.png', 'wb'){ |f| f.write @image}
    end

    # def show
    #    @batch = Batch.find(params[:id])
    # end
end
