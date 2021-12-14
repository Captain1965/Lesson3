#encoding utf-8
#добавляет вагоны к поезду add
#отцепляет вагоны если количество вагонов больше одного delete
require_relative 'train'
class TrainPassenger < Train
	attr_reader :type, :train_wagon
	def initialize
	@type  = 'passenger'	
	@train_wagon =[]
  end

	def add(wagon_passenger)
		@train_wagon << wagon_passenger
	end

	def delete
	 	if @train_wagon.size > 0
	 		@train_wagon.delete_at(-1)
	 	else 
	 		puts 'нет вагонов для удаления'
		end
	end
end

