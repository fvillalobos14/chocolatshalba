class QualityControl < ApplicationRecord
  has_many :results
  belongs_to :batch
  has_one :revision

  validates :code, presence: true
  validates :cut_at, presence: true
  validates :made_by, presence: true
  validates :observation, presence: true

  before_destroy :remove_results_revision

  def remove_results_revision
    Result.where(quality_control_id: id).destroy_all
    Revision.where(quality_control_id: id).destroy_all
  end
end
