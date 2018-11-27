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

  def defineResult()
    batch=Batch.find(self.id)
    contador = 0;
    current_quality = "A"
    Category.all.order(:place).each do |category|
      break if category.place == 4
      category.parameters.order(:place).each do |parameter|
        contador++
        value = -1
        div = batch.beans / 100
        if parameter.acceptance != nil
          if category.runs > 1
            value = Result.where(parameter_id: parameter.id, batch_id: batch.id).sum(:score)/(batch.beans/100)
          else
            value = Result.where(parameter_id: parameter.id, batch_id: batch.id, run: 1).first.score
          end
          puts "Debugging: #{contador.to_s} #{parameter.name} => #{value.to_s} entro en: " 
          #------------------------
          if current_quality == "A"
              if parameter.acceptance.min_qualityA == -1
                if parameter.acceptance.max_qualityA < value
                  current_quality = "B"
                  puts "A -> B"
                end
              elsif parameter.acceptance.max_qualityA == -1
                if parameter.acceptance.min_qualityA > value
                  current_quality = "B"
                  puts "A -> B"
                end
              end
          end
          #-------------------------
          if current_quality == "B"
              if parameter.acceptance.min_qualityB == -1
                if parameter.acceptance.max_qualityB < value
                  current_quality = "C"
                  puts "B -> C"
                end
              elsif parameter.acceptance.max_qualityB == -1
                if parameter.acceptance.min_qualityB > value
                  current_quality = "C"
                  puts "B -> C"
                end
              end
          end
          #---------------------------
          if current_quality == "C"
              if parameter.acceptance.min_qualityC == -1
                if parameter.acceptance.max_qualityC < value
                  current_quality = "C"
                  puts "C"
                  break
                end
              elsif parameter.acceptance.max_qualityC == -1
                if parameter.acceptance.min_qualityC > value
                  current_quality = "C"
                  puts "C"
                  break
                end
              end
          end
        end
      end
      if current_quality == "C"
        break
      end
    end
    batch.cocoaType = CocoaType.where("name = ?",current_quality).first.id
    if batch.ft && (current_quality == "C" || current_quality == "B")
      batch.ft=false;
    end
    batch.generateCode()
    batch.save
    return current_quality
  end

  def defineResultSens()
    batch=Batch.find(self.id)
    contador = 0;
    current_quality = "A"
    category = Category.where("id = ?",4).first
      category.parameters.order(:place).each do |parameter|
        contador++
        value = -1
        div = batch.beans / 100
        if parameter.acceptance != nil
          if category.runs > 1
            value = Result.where(parameter_id: parameter.id, batch_id: batch.id).sum(:score)/(batch.beans/100)
          else
            value = Result.where(parameter_id: parameter.id, batch_id: batch.id, run: 1).first.score
          end
          puts "Debugging: #{contador.to_s} #{parameter.name} => #{value.to_s} entro en: " 
          #------------------------
          if current_quality == "A"
              if parameter.acceptance.min_qualityA == -1
                if parameter.acceptance.max_qualityA < value
                  current_quality = "B"
                  puts "A -> B"
                end
              elsif parameter.acceptance.max_qualityA == -1
                if parameter.acceptance.min_qualityA > value
                  current_quality = "B"
                  puts "A -> B"
                end
              end
          end
          #-------------------------
          if current_quality == "B"
              if parameter.acceptance.min_qualityB == -1
                if parameter.acceptance.max_qualityB < value
                  current_quality = "C"
                  puts "B -> C"
                end
              elsif parameter.acceptance.max_qualityB == -1
                if parameter.acceptance.min_qualityB > value
                  current_quality = "C"
                  puts "B -> C"
                end
              end
          end
          #---------------------------
          if current_quality == "C"
              if parameter.acceptance.min_qualityC == -1
                if parameter.acceptance.max_qualityC < value
                  current_quality = "C"
                  puts "C"
                  break
                end
              elsif parameter.acceptance.max_qualityC == -1
                if parameter.acceptance.min_qualityC > value
                  current_quality = "C"
                  puts "C"
                  break
                end
              end
          end
        end
      end
    batch.cocoaType = CocoaType.where("name = ?",current_quality).first.id
    if batch.ft && (current_quality == "C" || current_quality == "B")
      batch.ft=false;
    end
    batch.generateCode()
    batch.save
    return current_quality
  end
  
  def updateState()
    batch = Batch.find(self.id)
    if batch.sensory_analysis == nil && batch.quality_control == nil
      batch.state = "Rec. Ingesado"
    elsif batch.sensory_analysis != nil || (batch.cocoaType != 1 && batch.quality_control != nil)
      batch.state = "Evaluado"
    elsif batch.quality_control != nil
      batch.state = "En Evaluacion"
    end

    batch.save
  end
  
end
