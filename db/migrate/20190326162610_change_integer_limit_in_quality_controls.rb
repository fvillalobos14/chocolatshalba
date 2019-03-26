class ChangeIntegerLimitInQualityControls < ActiveRecord::Migration[5.1]
  def change
    change_column :quality_controls, :code, :integer, limit: 8
  end
end
