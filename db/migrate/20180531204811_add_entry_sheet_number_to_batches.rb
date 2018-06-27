class AddEntrySheetNumberToBatches < ActiveRecord::Migration[5.1]
  def change
    add_column :batches, :entrySheetNumber, :integer
  end
end
