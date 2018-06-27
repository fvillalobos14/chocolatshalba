class InventoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @entries = EntryControl.search(params[:searchbox].to_s, params[:from].to_s,params[:to].to_s)
    part1 = request.original_url.to_s.split("?")[0]
    part2 = request.original_url.to_s.split("?")[1]
    @new_url = part1 + ".pdf"
    if part2 != nil
      @new_url = @new_url + "?" + part2
    end
    respond_to do |format|
      format.html
      format.pdf {render template: 'inventories/pdf', pdf: 'pdf'}
    end
  end

end