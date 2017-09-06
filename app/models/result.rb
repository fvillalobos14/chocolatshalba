class Result < ApplicationRecord
  belongs_to :quality_control
  belongs_to :parameter

  validates :score, presence: true
  validates :run, presence: true
  validates :parameter, presence: true
  validates :quality_control, presence: true
end
