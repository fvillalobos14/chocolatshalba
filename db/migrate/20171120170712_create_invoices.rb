class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.boolean :paid  
      t.references :batch, foreign_key: true

      t.timestamps
    end
  end
end
