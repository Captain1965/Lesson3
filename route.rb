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
		@stations[-1], @stations[-2] = @stations[-2], @stations[-1]
		
	end 
	def delete_station(station)
		@stations.delete(station)
	end 
end

