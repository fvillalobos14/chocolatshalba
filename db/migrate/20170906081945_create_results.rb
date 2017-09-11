class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.decimal :score
      t.integer :run
      t.references :parameter, foreign_key: true
      t.references :quality_control, foreign_key: true

      t.timestamps
    end
  end
end
