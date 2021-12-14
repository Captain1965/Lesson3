#encoding utf-8

def wagon_show(wagons)                                                # показать список вагонов
  puts ' У вас имеются вагоны'
  wagons.each do |i| 
    puts " вагон номер #{i.number} тип #{i.type}, состояние #{i.condition}"
    end  
end

def trains_show(trains)                                               # просмотреть список поездов
  puts "  Всего сфомированo поездов  #{trains.size}"
  trains.each do |i|      puts " Поезд номер #{i.number} имеет тип #{i.type}      количество вагонов #{i.train_wagon.size}"
  end  
end

def route_show(routes)                                                # показать маршруты  
  if routes.empty? 
    puts ' В списке нет сформированных маршрутов'
    return 
  else puts ' Вы можете выбрать следующие маршруты :'
  end  
  puts
  routes.each_with_index do |item, index|
    puts " маршрут №  #{index}      начало маршрута #{item.stations[0]} конец маршрута #{item.stations[-1]}"
    puts " Станции по пути следования :"
    item.stations.each do |i|
      print "  #{i}"
    end    
    puts
  end
  puts
end 

def station_show(stations)                                              # Просмотреть станции
  puts ' У вас имеются следующие станции'
  stations.each do |item|
  puts "    #{item.name}"
  end
end

def trains_number_station_show(stations,trains)                         # Показать номера поездов и станции где они находятся 
   puts "  Список поездов с информацией об иx месте нахождения"
   trains.each do |i| 
    puts " Поезд номер #{i.number}  находится на станции #{i.route.stations[i.curent_station_index]}" if i.route != nil 
   end 
end
