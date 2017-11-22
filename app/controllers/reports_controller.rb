class ReportsController < ApplicationController
  def organization
    @entries = EntryControl.search(params[:searchbox].to_s)

    respond_to do |format|
      format.html
      format.pdf {render template: 'reports/pdf', pdf: 'pdf'}
    end
  end
end
