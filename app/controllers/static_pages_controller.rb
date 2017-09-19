class StaticPagesController < ApplicationController
	before_action :authenticate_user!
	def dashboard
		@batches = Batch.count
		@dataGen = geneticData
		@dataTyp = typeData
		@option ={}
	end

	private
	def geneticData
		dataname = []
		for gen in GeneticMaterial.all
			dataname.append(gen.name)
		end
		datavalues = []
		for data in dataname
			datavalues.append(Batch.where('geneticMaterial ='+GeneticMaterial.find_by_name(data).id.to_s).count)
		end
		data = {
				labels: dataname,
				datasets: [
						{
								label: "Geneticca",
								backgroundColor: [
										"#84FF63",
										"#6384FF"
								],
								data: datavalues
						}
				]
		};
		return data
	end

	def typeData
		dataname = []
		for coc in CocoaType.all
			dataname.append(coc.name)
		end
		datavalues = []
		for data in dataname
			datavalues.append(Batch.where('cocoaType ='+CocoaType.find_by_name(data).id.to_s).count)
		end
		data = {
				labels: dataname,
				datasets: [
						{
								label: "Tipo de Cacao",
								backgroundColor: [
										"#FF6384",
										"#63FF84",
										"#84FF63",
										"#8463FF",
										"#6384FF"
								],
								data: datavalues
						}
				]
		};
		return data
	end

	def entryCMonth
		dates = (6.months.ago.to_date..Date.today).collect(&:month).uniq
	end
end
