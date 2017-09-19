class CreateAcceptances < ActiveRecord::Migration[5.1]
  def change
    create_table :acceptances do |t|
      t.decimal :max_qualityA
      t.decimal :max_qualityB
      t.decimal :max_qualityC
      t.decimal :min_qualityA
      t.decimal :min_qualityB
      t.decimal :min_qualityC
      t.references :parameter, foreign_key: true

      t.timestamps
    end
  end
end
