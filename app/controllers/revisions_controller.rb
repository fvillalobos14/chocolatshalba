class RevisionsController < ApplicationController
  def index
    @batches = Batch.all
  end

  def create
    @qualityControl = QualityControl.find(params[:quality_control_id])
    @revision = @qualityControl.build_revision(revision_params)
    if @revision.save
      createNotification
    end
    @notification = Notification.where("kind = 2").first
    @notification.destroy
    redirect_to revisions_path
  end

  private
    def revision_params
      params.require(:revision).permit(:status)
    end

    def createNotification
      @notification = Notification.create(read: false, kind: 3)
      @notification.save
    end
end
