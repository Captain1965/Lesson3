#encoding utf-8
=begin
-Имеет начальную (station_start) и конечную станцию (station_end), а также список 
 промежуточных станций stations. Начальная и конечная 
станции указываются при создании маршрута, а промежуточные могут добавляться между ними.
-Может добавлять промежуточную станцию в список add_station
-Может удалять промежуточную станцию из списка del_station
-Может выводить список всех станций по-порядку от начальной до конечной 
=end
class Route
	attr_accessor :stations
	attr_writer :station
	def initialize(station_start, station_end)
		@stations = [station_start, station_end]
	end

	def add_station(station)
		@stations << station
		stations[-1], stations[-2] = stations[-2], stations[-1]
	end 
	def delete_station(station)
		@stations.delete(station)
	end 
end

=begin
routes =[]
a = Route.new('a','b')
routes << a 
b = Route.new('c','d')
routes << b 

puts routes[0].stations[0]
puts routes[1].stations[1]
puts routes[1].add_station('e')
print routes[1].stations
print routes[0].stations 
puts routes[0].delete_station('e')
print routes[0].stations
=end
