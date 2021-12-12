#encoding utf-8
#создается вагон 
#имеет состояние прицеплен или нет free / busy
class Wagon
	attr_accessor :condition, :number
	def initialize
		@condition  = 'free'
	end
end

