class CreateCheckings < ActiveRecord::Migration[5.1]
  def change
    create_table :checkings do |t|
      t.references :batch, foreign_key: true
      t.timestamps
    end
  end
end
