class AddFtToBatch < ActiveRecord::Migration[5.1]
  def change
    add_column :batches, :ft, :boolean
  end
end
