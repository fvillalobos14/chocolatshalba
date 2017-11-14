class CheckingsController < ApplicationController
  def index
    @batches = Batch.all
  end

  def show
  end
end
