class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.decimal :place
      t.decimal :runs

      t.timestamps
    end
  end
end
