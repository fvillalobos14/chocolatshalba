class AddReceivedByToBatches < ActiveRecord::Migration[5.1]
  def change
    add_column :batches, :receivedBy, :string
  end
end
