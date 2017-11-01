class AddPertainToCertificateCheck < ActiveRecord::Migration[5.1]
  def change
    add_column :certificate_checks, :pertain, :integer
  end
end
