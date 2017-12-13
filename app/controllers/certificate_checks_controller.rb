class CertificateChecksController < ApplicationController
  before_action :authenticate_user!
  def create
    batch = Batch.find(params[:batch_id])
    certificate = batch.certificate_checks.create(certificate_params)
    certificate.save
    if certificate.decision == 1
      if not batch.quality_control.revision.nil?
        createNotification
        batch.buy = 1
        batch.save
      end
      notification = Notification.where(kind: 4, read: false).first
      notification.update(read: true)
      notification.save
    end
    redirect_to checkings_path
  end

  private
    def certificate_params
      params.require(:certificate_check).permit(:description,:decision)
    end

  def createNotification
    notification = Notification.create(read: false, kind: 5)
    notification.save
  end
end
