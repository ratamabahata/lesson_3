#Класс Train (Поезд)
class Train
  attr_accessor :speed
  attr_reader :wagon_count, :current_station, :number, :type_wagon

#Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов
  def initialize(number, type, wagon_count)
  @number = number
  @type = type
  @wagon_count = wagon_count
  @speed = 0
  end
#состояние покоя
  def stop
  self.speed = 0
  end
#функция добавления вагонов
  def add_wagon
  @wagon_count += 1 if speed.zero?
  end
#удаление вагонов
  def remove_wagon
  @wagon_count -= 1 if speed.zero? && wagon_count > 0
  end
#определение маршрута
  def define_route(route)
  @route = route
  station = route.path.first
  station.take_train(self)
  @current_station = station
  end
#прибыватие на станцию
  def arrive_at_station(station)
    if [prev_station, next_station].include?(station)
    current_station.delete_train(self)
    station.take_train(self)
    @current_station = station
    end
  end
#перемещение вперед на станцию
  def forward
    arrive_at_station(next_station)
  end
#перемещение назад на станцию
  def backward
    arrive_at_station(prev_station)
  end
#предыдущая статься
  def prev_station
    idx_current_station = @route.path.index(@current_station)
    @route.path[idx_current_station - 1] if idx_current_station > 0
  end
#следующая станция
  def next_station
    idx_current_station = @route.path.index(@current_station)
    @route.path[idx_current_station + 1] if idx_current_station < @route.path.length - 1
  end
end
