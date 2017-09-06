class QualityControl < ApplicationRecord
  has_many :results
  belongs_to :batch

  validates :code, presence: true
  validates :cut_at, presence: true
  validates :observation, presence: true
  validates :made_by, presence: true
end
