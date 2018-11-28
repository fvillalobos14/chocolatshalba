class EntryControl < ApplicationRecord
  belongs_to :organization
  has_many :batches
  has_attached_file :ec_files
  do_not_validate_attachment_file_type :ec_files
  has_many :documents
  has_many :filechecklists

  validates :organization, presence: true
  validates :entryDate, presence: true
  validates :exchangeRate, presence: true
  validates :receivedBy, presence: true
  validates :deliveredBy, presence: true

  before_destroy :remove_batches

  def remove_batches
    Batch.where(entry_control_id: id).destroy_all
  end

  def self.search(search, from, hasta)

    dateFrom = DateTime.new(1996,02,16,0,0,0)
    dateTo = DateTime.now

    if from != ""
      fromsp = from.split(" ")
      dateFrom = DateTime.new(fromsp[2].to_i,Date::MONTHNAMES.index((fromsp[1]).tr(',','')),fromsp[0].to_i,0,0,0)
    end

    if hasta != ""
      tosp = hasta.split(" ")
      dateTo = DateTime.new(tosp[2].to_i,Date::MONTHNAMES.index((tosp[1]).tr(',','')),tosp[0].to_i,0,0,0)
    end

    if search.to_s != nil
      organization = Organization.find_by_name(search.to_s)
      if organization != nil
       where({organization_id: organization.id, created_at: dateFrom..dateTo})
      else
        where(created_at: dateFrom..dateTo)
      end
    else
      where(created_at: dateFrom..dateTo)
    end

  end

  def validateBatches
    valid = false;
    self.batches.each do |batch|
      if batch.state == "Rec. Ingresado" || batch.state == "En Evaluacion"
        valid = true;
      end
    end
    return valid
  end

end
