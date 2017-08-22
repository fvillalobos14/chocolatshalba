class Organization < ApplicationRecord
	has_many :collectioncenters

	validates :code, presence: true
	validates :name, presence: true
end
