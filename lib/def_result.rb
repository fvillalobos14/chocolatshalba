module DefineResult
    def defineResult(batchid)
        puts batchid
        batch=Batch.find(batchid)
        puts batch.beans
        current_quality = "A"
        Category.all.order(:place).each do |category|
          category.parameters.order(:place).each do |parameter|
            value = -1
            div = batch.beans / 100
            if parameter.acceptance != nil
              if category.runs > 1
                value = Result.where(parameter_id: parameter.id, batch_id: batch.id).sum(:score)/(div)
              else
                value = Result.where(parameter_id: parameter.id, batch_id: batch.id, run: 1).first.score
              end
              #------------------------
              if current_quality == "A"
                  if parameter.acceptance.min_qualityA == -1
                    if parameter.acceptance.max_qualityA < value
                      current_quality = "B"
                    end
                  elsif parameter.acceptance.max_qualityA == -1
                    if parameter.acceptance.min_qualityA > value
                      current_quality = "B"
                    end
                  end
              end
              #-------------------------
              if current_quality == "B"
                  if parameter.acceptance.min_qualityB == -1
                    if parameter.acceptance.max_qualityB < value
                      current_quality = "C"
                    end
                  elsif parameter.acceptance.max_qualityB == -1
                    if parameter.acceptance.min_qualityB > value
                      current_quality = "C"
                    end
                  end
              end
              #---------------------------
              if current_quality == "C"
                  if parameter.acceptance.min_qualityC == -1
                    if parameter.acceptance.max_qualityC < value
                      current_quality = "C"
                      break
                    end
                  elsif parameter.acceptance.max_qualityC == -1
                    if parameter.acceptance.min_qualityC > value
                      current_quality = "C"
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
        return current_quality
      end
end