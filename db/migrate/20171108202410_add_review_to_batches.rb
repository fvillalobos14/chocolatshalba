class AddReviewToBatches < ActiveRecord::Migration[5.1]
  def change
    add_column :batches, :review, :integer, default: 0
  end
end
