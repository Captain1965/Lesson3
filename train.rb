#encoding utf-8
=begin
-Имеет номер (произвольная строка) (number) и тип (type )(грузовой-cargo, 
 пассажирский - pass) и количество вагонов (wagon_quality) 
эти данные указываются при создании экземпляра класса
-Может набирать скорость (speed)
-Может возвращать текущую скорость (curent_speed)
-Может тормозить (сбрасывать скорость до нуля)(stop)
-Может возвращать количество вагонов 
-Может прицеплять/отцеплять вагоны (add_wagon / delete_wagon)(по одному вагону за операцию, метод просто увеличивает 
или уменьшает количество вагонов). Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
-Может принимать маршрут следования (объект класса Route). 
-При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
-Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, 
но только на 1 станцию за раз. (arrive_train)
-Возвращать предыдущую станцию, текущую, следующую, на основе маршрута 
=end
class Train
	attr_writer :number, :type, :route
	attr_reader :curent_speed, 
	attr_accessor :wagon_quality
	def initialize(number, type, wagon_quality)
		@number 
		@curent_speed = 0
	end
  
  def speed(value)
  	@curent_speed +=value
  end

  def stop
  	@curent_speed = 0
  end
 	
  def add_wagon
  	@wagon_quality +=1 if @curent_speed = 0
  end	

  def delete_wagon
  	@wagon_quality -=1 if @wagon_quality > 1 && @curent_speed = 0
  end	

  def add_route(route)
  	@route = route 
  	@curent_station_index = 0
  end	

  def departure
  	curent_station_index +=1 if curent_station_index < route.size-1
  end

  def arrival
  	curent_station_index -=1 if curent_station_index => 1
  end
end 