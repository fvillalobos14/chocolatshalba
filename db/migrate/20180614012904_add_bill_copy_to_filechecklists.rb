class AddBillCopyToFilechecklists < ActiveRecord::Migration[5.1]
  def change
    add_column :filechecklists, :billCopy, :boolean
  end
end
