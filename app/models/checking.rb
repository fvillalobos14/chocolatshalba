class Checking < ApplicationRecord
  belongs_to :batch
  has_many :certificate_checks
end
