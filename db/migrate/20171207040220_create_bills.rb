class CreateBills < ActiveRecord::Migration[5.1]
  def change
    create_table :bills do |t|
      t.integer :code
      t.references :invoice, foreign_key: true

      t.timestamps
    end
  end
end
