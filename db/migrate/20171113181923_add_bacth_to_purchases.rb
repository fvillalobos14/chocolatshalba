class AddBacthToPurchases < ActiveRecord::Migration[5.1]
  def change
    add_reference :purchases, :batch, foreign_key: true
  end
end
