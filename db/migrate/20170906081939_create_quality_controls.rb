class CreateQualityControls < ActiveRecord::Migration[5.1]
  def change
    create_table :quality_controls do |t|
      t.integer :code
      t.string :final_code
      t.date :cut_at
      t.boolean :f_harvest
      t.boolean :s_harvest
      t.boolean :trinitary
      t.boolean :outsider
      t.string :observation
      t.string :made_by
      t.references :batch, foreign_key: true

      t.timestamps
    end
  end
end
