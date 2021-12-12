#encoding utf-8
#Добавляется определение типа вагона type cargo
require_relative 'wagon'
class WagonCargo < Wagon
	attr_reader :type
	def initialize
		@type = 'cargo'
		@condition = 'free'
	end
end