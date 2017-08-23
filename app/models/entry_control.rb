class EntryControl < ApplicationRecord
  belongs_to :organization
  has_many :batches

  validates :organization, presence: true
  validates :entryDate, presence: true
  validates :exchangeRate, presence: true
  validates :receivedBy, presence: true
  validates :deliveredBy, presence: true
end
