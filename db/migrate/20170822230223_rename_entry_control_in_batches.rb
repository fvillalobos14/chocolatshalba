class RenameEntryControlInBatches < ActiveRecord::Migration[5.1]
  def change
   	rename_column :batches, :entryControl_id, :entry_control_id
  end
end
