class Parameter < ApplicationRecord
  belongs_to :category
  has_one :acceptance

  validates :name, presence: true
  validates :place, presence: true
  validates :category, presence: true
end
