class CreateParameters < ActiveRecord::Migration[5.1]
  def change
    create_table :parameters do |t|
      t.string :name
      t.string :unit
      t.integer :place
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
