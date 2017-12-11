class Invoice < ApplicationRecord
    belongs_to :batch
    has_many :bills
end
