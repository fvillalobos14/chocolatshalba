class CreateCertificateTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :certificate_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
