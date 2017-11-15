class Result < ApplicationRecord
  belongs_to :batch
  belongs_to :parameter

  validates :score, presence: true
  validates :run, presence: true
  validates :parameter, presence: true
  validates :batch, presence: true
end
