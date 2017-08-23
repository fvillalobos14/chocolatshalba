class RenameTypeInBatch < ActiveRecord::Migration[5.1]
  def change
   rename_column :batches, :type, :cocoaType
end
end
