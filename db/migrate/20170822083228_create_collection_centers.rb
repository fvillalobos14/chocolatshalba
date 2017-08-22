class CreateCollectionCenters < ActiveRecord::Migration[5.1]
  def change
    create_table :collection_centers do |t|
      t.string :code
      t.string :name
      t.references :organization, foreign_key: true

      t.timestamps
    end
  end
end
