class Document < ApplicationRecord
  belongs_to :entry_control
  has_attached_file :ec_data
  do_not_validate_attachment_file_type :ec_data
end
