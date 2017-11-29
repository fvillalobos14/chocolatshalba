class SensoryAnalysis < ApplicationRecord
    belongs_to :batch
      
    validates :made_by, presence: true
    validates :observation, presence: true

end
