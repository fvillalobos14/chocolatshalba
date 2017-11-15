class AddAttachmentDataToDocuments < ActiveRecord::Migration[5.1]
  def self.up
    change_table :documents do |t|
      t.attachment :ec_data
    end
  end

  def self.down
    remove_attachment :documents, :ec_data
  end
end
