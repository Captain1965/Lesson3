#encoding utf-8
#добавляет вагоны к поезду add
#отцепляет вагоны если количество вагонов больше одного delete
require_relative 'train'
require_relative 'wagon'
require_relative 'wagon_passenger'
require_relative 'wagon_cargo'
class PassengerTrain < Train
	attr_accessor :number
	attr_reader :type, :wagons
	def initialize
	@wagons = []
	@type  = 'passenger'	
  end
end

