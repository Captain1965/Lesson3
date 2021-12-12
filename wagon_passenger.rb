#encoding utf-8
#Добавляется определение типа вагона type passeger
require_relative 'wagon'
class WagonPassenger < Wagon
	attr_reader :type
	def initialize
		@type = 'passenger'
		@condition = 'free' 
	end
end
