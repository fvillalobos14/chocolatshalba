class Organization < ApplicationRecord
  has_many :collection_centers
  has_many :entry_controls

  validates :code, presence: true
  validates :name, presence: true

  before_destroy :remove_collection_centers_entry_controls

  def remove_collection_centers_entry_controls
    CollectionCenter.where(organization_id: id).destroy_all
    EntryControl.where(organization_id: id).destroy_all
  end
end
