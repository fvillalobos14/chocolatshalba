class CreateEntryControls < ActiveRecord::Migration[5.1]
  def change
    create_table :entry_controls do |t|
      t.references :organization, foreign_key: true
      t.date :entryDate
      t.decimal :exchangeRate
      t.string :receivedBy
      t.string :deliveredBy

      t.timestamps
    end
  end
end
