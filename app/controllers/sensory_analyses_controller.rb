class SensoryAnalysesController < ApplicationController
    before_action :authenticate_user!
    def new
        @batch=Batch.find(params[:batch_id])
        @sensoryAnalysis=@batch.build_sensory_analysis
    end

    def create
        batch=Batch.find(params[:batch_id])
        sensoryAnalysis=batch.build_sensory_analysis(sensory_params)
        entry=EntryControl.find(batch.entry_control_id)
    
        if sensoryAnalysis.save
            params["results"].each do |result|
              Result.create(:batch_id => batch.id, :parameter_id => result["parameter_id"], :run => result["run"], :score => result["score"])
            end

            if not batch.quality_control.nil?
                notification = Notification.where("kind = 1").first
                notification.destroy
                createNotification(batch)
                batch.review=1
                batch.save
            end
            redirect_to entry
        else
            redirect_to "/batches/"+batch.id.to_s+"/sensory_analyses/new"
        end
      end

      private
      def sensory_params
        params.require(:sensory_analysis).permit(:observation, :made_by)
      end

      def createNotification(batch)
        batch=Batch.find(batch.id)
        notification = Notification.create(read: false, kind: 2)
        notification.save
        if batch.ft 
            notification1 = Notification.create(read: false, kind: 4)
            notification1.save
        end 
      end
end
