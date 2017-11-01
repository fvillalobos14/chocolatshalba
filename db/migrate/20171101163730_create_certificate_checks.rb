class CreateCertificateChecks < ActiveRecord::Migration[5.1]
  def change
    create_table :certificate_checks do |t|
      t.integer :decision
      t.text :description
      t.references :checking, foreign_key: true
      t.timestamps
    end
  end
end
