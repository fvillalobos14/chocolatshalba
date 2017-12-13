class AddAttachmentInvoiceDocToBills < ActiveRecord::Migration[5.1]
  def self.up
    change_table :bills do |t|
      t.attachment :invoice_doc
    end
  end

  def self.down
    remove_attachment :bills, :invoice_doc
  end
end
