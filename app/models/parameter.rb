class Parameter < ApplicationRecord
  belongs_to :category

  validates :name, presence: true
  validates :unit, presence: true
  validates :place, presence: true
  validates :category, presence: true
end
