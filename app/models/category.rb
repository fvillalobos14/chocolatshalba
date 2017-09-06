class Category < ApplicationRecord
  has_many :parameters

  validates :name, presence: true
  validates :place, presence: true
  validates :runs, presence: true
end
