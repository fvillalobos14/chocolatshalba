class AddSamplesToBatches < ActiveRecord::Migration[5.1]
  def change
    add_column :batches, :samples, :integer
  end
end
