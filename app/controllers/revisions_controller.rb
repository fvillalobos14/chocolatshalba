class RevisionsController < ApplicationController
  before_action :authenticate_user!
  def index
    @batches = Batch.all
  end

  def create
    qualityControl = QualityControl.find(params[:quality_control_id])
    revision = qualityControl.build_revision(revision_params)
    if revision.save
     
    
    notification = Notification.where("kind = 2").first
    notification.destroy
    batch=qualityControl.batch

    if not qualityControl.batch.ft or not qualityControl.batch.certificate_checks.first.nil?
      createNotification
      if batch.ft
        batch.review = 1
      else
        batch.review = 2
        batch.buy = 1
      end
      batch.save
    end
  end

    redirect_to revisions_path
  end

  private
    def revision_params
      params.require(:revision).permit(:status)
    end

    def createNotification
      notification = Notification.create(read: false, kind: 5)
      notification.save
    end
end
