class Batch < ApplicationRecord
	belongs_to :entry_control
	has_one :quality_control

	validates :sackAmount, presence: true
	validates :weight, presence: true
	validates :enterCode, presence: true
	validates :cocoaType, presence: true
	validates :geneticMaterial, presence: true
	validates :entry_control, presence: true

	before_destroy :remove_quality_control

  def remove_quality_control
    QualityControl.where(batch_id: id).destroy_all
  end
end
