class CocoaType < ApplicationRecord
	has_one :price

	validates :name, presence: true
end
