class BarcodesController < ApplicationController
    before_action :authenticate_user!
    def new
        require 'barby'
        require 'barby/barcode/code_128'
        require 'barby/outputter/png_outputter'
        @batch=Batch.find(params[:batch_id])
        @bc128 = Barby::Code128B.new(@batch.enterCode)
        @bcimage = Barby::PngOutputter.new(@bc128).to_png
        respond_to do |format|
            format.html
            format.png do
              send_data @bcimage, type: "image/png", disposition: "inline"
            end
          end
        /puts Rails.application.assets.paths[1]/
        File.open('barcode.png', 'wb'){ |f| f.write @bcimage}
    end

    # def show
    #    @batch = Batch.find(params[:id])
    # end
end
