class CreateSensoryAnalyses < ActiveRecord::Migration[5.1]
  def change
    create_table :sensory_analyses do |t|
      t.string :observation
      t.string :made_by
      t.references :batch, foreign_key: true

      t.timestamps
    end
  end
end
