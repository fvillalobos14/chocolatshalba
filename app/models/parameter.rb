class Parameter < ApplicationRecord
  belongs_to :category
  has_one :acceptance

  validates :name, presence: true
  validates :place, presence: true
  validates :category, presence: true

  before_destroy :remove_acceptance

  def remove_acceptance
    Acceptance.where(parameter_id: id).destroy_all
  end
end
