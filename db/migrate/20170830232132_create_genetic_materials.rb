class CreateGeneticMaterials < ActiveRecord::Migration[5.1]
  def change
    create_table :genetic_materials do |t|
      t.string :name

      t.timestamps
    end
  end
end
