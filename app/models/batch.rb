class Batch < ApplicationRecord
	belongs_to :entry_control
	belongs_to :export_batch, optional: true
	has_one :quality_control
	has_one :sensory_analysis
	has_many :certificate_checks
	has_one :purchase
	has_one :invoice
	has_many :results

	validates :sackAmount, presence: true
	validates :weight, presence: true
	validates :enterCode, presence: true
	validates :cocoaType, presence: true
	validates :geneticMaterial, presence: true
	validates :entry_control, presence: true

	before_destroy :remove_quality_control
    before_update :generateCode
    before_save :generateCode

  def remove_quality_control
    QualityControl.where(batch_id: id).destroy_all
  end
  
  def generateCode
    
    quality=CertificateType.find(self.certificatetype).name
    cocoat=CocoaType.find(self.cocoaType).name
    c = entry_control.organization.code+"0"+postharvestCenter.to_s+"-"+entry_control.entryDate.strftime('%d%m%y')+"-"+quality+cocoat+GeneticMaterial.find(self.geneticMaterial).name
    code=""
    if ft
        if quality== 'C' && cocoat == 'C'
            code=c
            self.ft=false
        else  
            code=c+"-FT"

        end
    else
    code= c
    end
    self.enterCode=code
  end
  
  
end
