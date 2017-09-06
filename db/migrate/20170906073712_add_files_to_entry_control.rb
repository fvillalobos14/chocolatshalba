class AddFilesToEntryControl < ActiveRecord::Migration[5.1]
  def change
  	add_attachment :entry_controls, :ec_files
  end
end
