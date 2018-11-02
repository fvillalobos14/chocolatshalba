class CreateSequences < ActiveRecord::Migration[5.1]
  def change
    create_table :sequences do |t|
      t.integer :number
      t.integer :year
      t.integer :day
      t.timestamps
    end
  end
end
