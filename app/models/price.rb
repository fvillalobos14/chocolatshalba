class Price < ApplicationRecord
    belongs_to :cocoa_type

    validates :price, presence: true, numericality: { greater_than: 0 }
end
