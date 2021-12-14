#encoding utf-8
=begin
-Имеет номер (произвольная строка) (number) 
эти данные указываются при создании экземпляра класса
-Может набирать скорость (speed)
-Может возвращать текущую скорость (curent_speed)
-Может тормозить (сбрасывать скорость до нуля)(stop)
-Может принимать маршрут следования (объект класса Route). 
-При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
-Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, 
но только на 1 станцию за раз. (arrive_train)
-Возвращать предыдущую станцию, текущую, следующую, на основе маршрута 
=end
class Train
  attr_accessor :number, :route
  attr_reader :curent_speed, :curent_station_index
  def initialize
    @curent_speed = 0
    @route = []
  end
  
  def speed(value)
    @curent_speed +=value 
  end

  def stop
    @curent_speed = 0
  end

  def add_route
    @curent_station_index = 0
  end 

  def departure
    @curent_station_index +=1 if @curent_station_index < @route.stations.size-1
  end

  def arrival
    @curent_station_index -=1 if @curent_station_index >= 1
  end
end 