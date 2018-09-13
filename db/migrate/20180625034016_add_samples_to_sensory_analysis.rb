class AddSamplesToSensoryAnalysis < ActiveRecord::Migration[5.1]
  def change
    add_column :sensory_analyses, :samples, :integer
  end
end
