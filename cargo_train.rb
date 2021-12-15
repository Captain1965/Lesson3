#encoding utf-8
#
require_relative 'train'
require_relative 'wagon'
require_relative 'wagon_passenger'
require_relative 'wagon_cargo'
require_relative 'train'
class CargoTrain < Train
	attr_accessor :number
	attr_reader :type, :wagons
	def initialize
	@wagons = []
	@type  = 'cargo'		
  end
end


