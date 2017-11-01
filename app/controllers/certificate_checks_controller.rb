class CertificateChecksController < ApplicationController

  def create
    @checking = Checking.find(params[:checking_id])
    @certificate = @checking.certificate_checks.create(certificate_params)
    @certificate.pertain = @checking.batch_id
    @certificate.save
    if @certificate.decision == 1
      createNotification
    end
    redirect_to checkings_path
  end

  private
    def certificate_params
      params.require(:certificate_check).permit(:description,:decision)
    end

  def createNotification
    #@notification = Notification.create(read: false, kind: 2)
    #@notification.save
  end
end
