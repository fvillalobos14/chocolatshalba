class EntryControl < ApplicationRecord
  belongs_to :organization
  has_many :batches
  has_attached_file :ec_files
  do_not_validate_attachment_file_type :ec_files

  validates :organization, presence: true
  validates :entryDate, presence: true
  validates :exchangeRate, presence: true
  validates :receivedBy, presence: true
  validates :deliveredBy, presence: true

  before_destroy :remove_batches

  def remove_batches
    Batch.where(entry_control_id: id).destroy_all
  end
end
