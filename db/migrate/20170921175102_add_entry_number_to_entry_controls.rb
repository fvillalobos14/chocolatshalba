class AddEntryNumberToEntryControls < ActiveRecord::Migration[5.1]
  def change
    add_column :entry_controls, :entry_number, :integer
  end
end
