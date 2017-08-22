class Organization < ApplicationRecord
	has_many :collectionCenters
	has_many :entryControls

	validates :code, presence: true
	validates :name, presence: true
end
