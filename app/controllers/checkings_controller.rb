class CheckingsController < ApplicationController
  def index
    @batches = Batch.all
  end
end