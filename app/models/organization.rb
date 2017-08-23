class Organization < ApplicationRecord
  has_many :collection_centers
  has_many :entry_controls

  validates :code, presence: true
  validates :name, presence: true
end
