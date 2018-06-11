class AddDeliveredByToBatches < ActiveRecord::Migration[5.1]
  def change
    add_column :batches, :deliveredBy, :string
  end
end
