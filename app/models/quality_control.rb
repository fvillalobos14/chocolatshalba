class QualityControl < ApplicationRecord
  has_many :results
  belongs_to :batch
  has_many :revisions

  validates :code, presence: true
  validates :cut_at, presence: true
  validates :made_by, presence: true
end
