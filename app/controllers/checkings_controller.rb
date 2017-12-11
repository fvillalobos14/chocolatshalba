class CheckingsController < ApplicationController
  before_action :authenticate_user!
  def index
    @batches = Batch.all
  end
end