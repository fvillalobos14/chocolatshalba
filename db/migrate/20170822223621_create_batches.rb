class CreateBatches < ActiveRecord::Migration[5.1]
  def change
    create_table :batches do |t|
      t.integer :sackAmount
      t.decimal :weight
      t.string :enterCode
      t.integer :cocoaType
      t.integer :geneticMaterial
      t.boolean :moved, default: false
      t.references :entry_control, foreign_key: true

      t.timestamps
    end
  end
end
