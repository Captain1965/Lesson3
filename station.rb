#encoding utf-8
=begin
-Название может указываться при создании 
-Может принимать поезда (по одному за раз) (arrive_train)
-Может возвращать список всех поездов на станции, находящиеся в текущий момент (attr_reader trains )
-Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских(train_by_type)
-Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов,(gone_train) 
находящихся на станции).
=end
class Station
	attr_reader :trains, :name

	def initialize(name)
		@name = name
		@trains = []
	end 

	def trains_by_type(type)
		trains.count(type)
	end

	def arrive_train(train)
		@trains << train
	end

	def gone_train(number)
		@trains.delete(train)
	end

end

