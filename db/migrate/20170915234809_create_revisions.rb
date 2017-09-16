class CreateRevisions < ActiveRecord::Migration[5.1]
  def change
    create_table :revisions do |t|
      t.integer :status
      t.references :quality_control, foreign_key: true

      t.timestamps
    end
  end
end
