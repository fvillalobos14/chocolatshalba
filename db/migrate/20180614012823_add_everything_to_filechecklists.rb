class AddEverythingToFilechecklists < ActiveRecord::Migration[5.1]
  def change
    add_column :filechecklists, :everything, :boolean
  end
end
