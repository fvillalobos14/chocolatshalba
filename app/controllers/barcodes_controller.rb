require 'barby'
require 'barby/barcode/code_39'
require 'barby/outputter/png_outputter'

class BarcodesController < ApplicationController
    before_action :authenticate_user!
    def new
        @batch=Batch.find(params[:batch_id])
        file_path = "#{Rails.root}/app/assets/images/barcode39.png"
        barcode39 = Barby::Code39.new(@batch.enterCode) 
        File.open(file_path, 'wb'){|f| f.write barcode39.to_png }
    end
end
