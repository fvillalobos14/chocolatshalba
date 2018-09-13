class AddBeancountToBatches < ActiveRecord::Migration[5.1]
  def change
    add_column :batches, :beans, :integer
  end
end
