class AddPostharvestCenterToBatches < ActiveRecord::Migration[5.1]
  def change
    add_column :batches, :postharvestCenter, :integer
  end
end
