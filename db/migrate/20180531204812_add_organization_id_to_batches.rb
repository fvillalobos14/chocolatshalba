class AddOrganizationIdToBatches < ActiveRecord::Migration[5.1]
  def change
    add_column :batches, :organizationId, :integer
  end
end
