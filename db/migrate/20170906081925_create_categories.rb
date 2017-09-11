class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :place
      t.integer :runs

      t.timestamps
    end
  end
end
