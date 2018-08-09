class CreateFilechecklists < ActiveRecord::Migration[5.1]
  def change
    create_table :filechecklists do |t|
      t.boolean :referralSheet
      t.boolean :producersList
      t.boolean :inspectionSheet
      t.boolean :embacingControl
      t.boolean :collectionCleaningControl
      t.boolean :warehouseEntrySheet
      t.references :entry_control, foreign_key: true

      t.timestamps
    end
  end
end
