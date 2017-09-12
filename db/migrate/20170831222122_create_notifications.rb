class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.boolean :read
      t.integer :kind

      t.timestamps
    end
  end
end
