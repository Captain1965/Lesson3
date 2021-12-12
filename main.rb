#encoding - utf-8
=begin
     - Создавать станции
     - Создавать поезда
     - Создавать маршруты и управлять станциями в нем (добавлять, удалять)
     - Назначать маршрут поезду
     - Добавлять вагоны к поезду
     - Отцеплять вагоны от поезда
     - Перемещать поезд по маршруту вперед и назад
     - Просматривать список станций и список поездов на станции
=end
  #require_relative 'seed'
  require_relative 'wagon'
  require_relative 'wagon_passenger'
  require_relative 'wagon_cargo'
  require_relative 'train'
  require_relative 'train_passenger'
  require_relative 'train_cargo'
  require_relative 'station'
  require_relative 'route'

  def wagon_make
    puts 'Какой вагон необходим 1-грузовой , иное - пассажирский'
    a2 = STDIN.gets.chomp
      wagon = WagonCargo.new if a2 == '1'
      wagon = WagonPassenger.new if a2 != '1'
      puts 'Введите номер вагона '
      wagon.number = STDIN.gets.chomp
      return wagon
  end

  def wagon_show(wagons)
    puts ' У вас имеются вагоны'
    wagons.each do |i| 
    puts " вагон номер #{i.number} тип #{i.type}, состояние #{i.condition}"
    end  
  end

  def train_make
     puts 'Какой состав вы формируете 1-грузовой , иное - пассажирский'
      a2 = STDIN.gets.chomp
      train = TrainCargo.new if a2 == '1'
      train = TrainPassenger.new if a2 != '1'
      puts 'Введите номер поезда'
      a2 = STDIN.gets.chomp
      train.number = a2
      return train
  end 

  def trains_show(trains)
    puts "  Всего сфомированo поездов  #{trains.size}"
    trains.each do |i|
      puts " Поезд номер #{i.number} имеет тип #{i.type}      количество вагонов #{i.train_wagon.size}"
    end  
  end

  def train_add_wagon(trains,wagons)
    trains_show(trains)
    puts 'выберите номер поезда для добавления вагонов'
    a = STDIN.gets.chomp.to_i
    t = 0       #номер элемента массива в списке поездов с выбранным номером
    trains.each do |item|
      t = trains.index(item) if item.number == a
    end      
      wagon_show(wagons)
      puts 'Выберите номер вагона'
      w = 0     # номер элемента массива в списке вагонов выбранный для присоединения
      a = STDIN.gets.chomp.to_i
      wagons.each do |item|
        w = wagons.index(item) if item.number == a
      end
         if wagons[w].type != trains[t].type
          puts 'Типы поезда и вагона не совпадают'
          return 
        elsif wagons[w].condition == 'busy'
          return
        else 
        trains[t].add(wagons[w])
        wagons[w].condition = 'busy'          # Добавляем вагон к поезду
        end
  end
   
  def train_delete_wagon(trains,wagons)
    trains_show(trains)
    puts 'выберите номер поезда для  уменьшения количества вагонов'
    a = STDIN.gets.chomp.to_i
    t = 0   # номер элемента в списке массива 
    trains.each do |item|
      t = trains.index(item) if item.number == a
    end 
    trains[t].train_wagon[-1].condition = 'free' 
    trains[t].delete         
  end

  def route_make(stations)
    puts 'Ведите название начальной станции машрута из списка '
    station_show(stations)
    station_start = STDIN.gets.chomp
    puts 'Введите название конечной станции'
    station_end = STDIN.gets.chomp
    route = Route.new(station_start,station_end)
    return route
  end 

  def route_show(routes)
    puts ' Вы можете выбрать следующие машруты '
    routes.each_with_index do |item, index|
      puts " маршрут номер #{index} начало маршрута #{item.stations[0]} конец маршрута #{item.stations[-1]}"
      puts "Промежуточныестанции по пути следования #{item.stations[1..-2]}"
    end
  end 

  def rout_station_show
    route_show(routes)
    puts ' Выберите номер маршрута'
    i = STDIN.gets.chomp.to_i
    routes[i].each do |item|
      puts " Список станций по выбраному маршруту #{item}"
    end  
  end

  def route_add(stations)
    route_show(routes)
    puts ' Выберите номер маршрута на котором хотите добавить станцию '
    i = STDIN.gets.chomp.to_i
    station_show(stations)
    puts ' Введите название станции которую хотите добавить на маршруте'
    name = STDIN.gets.chomp
    routes[i].add_station(name)
  end

  def route_delete(stations)
    route_station_show 
    puts ' Выберите название станции которую хотите удалить'
    name = STDIN.gets.chomp
    routes[i].delete_station(name)
  end

  def train_route
    trains_show(trains)
    puts 'выберите номер поезда для назначения маршрута'
    i = STDIN.gets.chomp
    trains.each_with_index do |item ,index|
      t = index if item.number == i
    end
  end

  def station_make(stations)
  puts ' Введите название cтанции , для прекращения введите введите 0'
  loop do
    name = STDIN.gets.chomp
      break if name == '0'
      stations << Station.new(name) 
    end 
    return stations
  end

  def station_show(stations)
    puts 'У вас имеются следующие станции'
    stations.each_with_index do |item, index|
      puts "#{index+1} -  #{item.name}"
    end
  end

  def trains_station_show


  end




  MAIN_MENU =
  '  Выберите тип операции 
  1 - операции с вагонами
  2 - операции с поездами
  3 - операции со станциями
  4 - операции с маршрутами
  0 - выйти'

  WAGOON_MENU =
  '  Выберите операцию 
  1 - создать вагон
  2 - просмотреть все вагоны
  0 - вернуться в главное меню'

  TRAIN_MENU =
  '  Выберите операцию
  1 - создать поезд
  2 - добавить вагон
  3 - удалить вагон
  4 - просмотреть все поезда
  5 - назначить маршрут поезду
  6 - поехать по маршруту
  7 - вернуться по маршруту
  0 - вернуться в главное меню'

  STATION_MENU =
  '  Выберите операцию
  1 - создать станцию
  2 - просмотреть станции
  3 - просмотреть поезда на станции
  0 - вернуться в главное меню'

  ROUTES_MENU =
  '  Выберите операцию 
  1 - создать маршрут
  2 - добавить станцию к маршруту
  3 - удалить станцию на маршруте
  4 - показать машруты
  5 - показать список станций по маршруту
  0 - вернуться в главное меню'

  def start(wagons,trains,stations,routes) 
      loop do
      puts MAIN_MENU
      a = STDIN.gets.chomp
        case a 
        when '1' #операции с вагонами
         #wagons =[]
          loop do
          puts WAGOON_MENU
          b = STDIN.gets.chomp
            case b 
            when '1'                              #создать вагон
              wagons << wagon_make
            when '2'                              #показать список вагонов
              wagon_show(wagons)
            when '0'            #выйти
              break
            else 
            puts 'Сделайте Ваш выбор'
            end
          end 
        when '2' 
          loop do
          puts TRAIN_MENU
          b = STDIN.gets.chomp                 
            case b
            when '1' # сформировать поезд
              trains << train_make
            when '2' 
              train_add_wagon(trains,wagons)  # добавить вагон
            when '3' 
               train_delete_wagon(trains,wagons) # отцепить вагон
            when '4' 
               trains_show(trains)         # просмотреть список поездов
            when '5'
                train_route  # назначить маршрут поезду
            when '6'
                  # Поехать по маршруту
            when '7'        
                  # Вернуться по маршруту
            when '0'
            break        # Вернуться в главное меню
            else 
             puts " Сделайте Ваш выбор"
            end
          end
        when '3' 
          loop do
          puts STATION_MENU
          b = STDIN.gets.chomp
            case b
            when '1'
              station_make(stations)        #Создать список станций
            when '2'
              station_show(stations)          #Просмотреть станции
            when '3'
              trains_station_show    #Просмотреть поезда на станции
            when '0'
              break       #Вернуться в главное меню
            else 
              puts "Сделайте ваш выбор"
            end
          end 

        when '4'


          loop do
          puts ROUTES_MENU
          b = STDIN.gets.chomp
            case b
            when '1'
                 routes << route_make(stations)    #Создать маршрут
            when '2'
                 route_add(stations)          #Добавить станцию к маршрут
            when '3'
                 route_delete(stations)       #Удалить станцию из маршрута
            when '4' 
                 route_show(routes)         #показать маршруты
            when '5'        
                 route_station_show         # показать список станций по маршруту            
            when '0'  
             break         #вернуться в главное меню
            else 
            puts 'Сделайте Ваш выбор'
            end 
          end
        end 
      end    
    end   
