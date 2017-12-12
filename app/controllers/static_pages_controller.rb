class StaticPagesController < ApplicationController
	before_action :authenticate_user!
	def dashboard
	end

	def stages
		@batches = Batch.all
	end

	def traceability
		@batches = Batch.all
	end

	def quality_info
		batch_id = params[:lote].to_i
		@batch = Batch.find(batch_id)
		@qualityControl = @batch.quality_control
		@data =  dataChart(@batch.id)
	end

	private
	def dataValues(batch)
		batch=Batch.find(batch)
		data = []
		Category.all.order(:place).each do |category|
			category.parameters.order(:place).each do |parameter|
				if parameter.acceptance == nil
					if parameter.category.place = 4
						if category.runs = 1
							value = Result.where(parameter_id: parameter.id, batch_id: batch.id, run: 1).first.score
							data.append(value)
						end
					end
				end
			end
		end
		return data
	end

	def dataChart(batch)
		dataname = []
		paramaterPlace = Parameter.all
		for parama in paramaterPlace
			if parama.category.place == 4
				dataname.append(parama.name)
			end
		end
		datavalues = dataValues(batch)
		data = {
				labels: dataname,
				datasets: [
						{
								label: "Sensorial",
								borderColor: "rgba(50, 189, 158, 1)",
								backgroundColor: "rgba(50, 189, 158, 0.5)",
								data: datavalues
						}
				]
		}
		return data
	end
end
