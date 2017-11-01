class CheckingsController < ApplicationController
  def index
    @checkings = Checking.all
  end

  def show
    @checking = Checking.find(params[:id])
    @certificate = CertificateCheck.new
  end
end
