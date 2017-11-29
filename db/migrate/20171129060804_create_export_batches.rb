class CreateExportBatches < ActiveRecord::Migration[5.1]
  def change
    create_table :export_batches do |t|

      t.timestamps
    end
  end
end
