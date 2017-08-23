class CollectionCenter < ApplicationRecord
	belongs_to :organization

	validates :code, presence: true
	validates :name, presence: true
	validates :organization, presence: true
end
