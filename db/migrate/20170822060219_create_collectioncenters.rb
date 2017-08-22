class CreateCollectioncenters < ActiveRecord::Migration[5.1]
  def change
    create_table :collectioncenters do |t|
      t.string :code
      t.string :name
      t.references :organization, foreign_key: true

      t.timestamps
    end
  end
end
