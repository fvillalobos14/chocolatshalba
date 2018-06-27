class AddCertificatetypeToBatches < ActiveRecord::Migration[5.1]
  def change
    add_column :batches, :certificatetype, :integer
  end
end
