class Category < ApplicationRecord
  has_many :parameters

  validates :name, presence: true
  validates :place, presence: true
  validates :runs, presence: true

  before_destroy :remove_parameters

  def remove_parameters
    Parameter.where(category_id: id).destroy_all
  end
end
