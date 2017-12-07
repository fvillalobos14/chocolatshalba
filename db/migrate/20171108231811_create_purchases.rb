class CreatePurchases < ActiveRecord::Migration[5.1]
  def change
    create_table :purchases do |t|
      t.integer :decision
      t.references :batch, foreign_key: true

      t.timestamps
    end
  end
end
