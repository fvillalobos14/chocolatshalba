class Bill < ApplicationRecord
  belongs_to :invoice
  has_attached_file :invoice_doc
  do_not_validate_attachment_file_type :invoice_doc
end
