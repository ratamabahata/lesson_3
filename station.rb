#Класс Station (Станция)
class Station
  attr_reader :name, :trains
#создание списка названий и количество станций  
def initialize(name)
    @name = name
    @trains = []
  end
#добавление новых поездов на станцию
  def take_train(train)
    @trains << train
  end
#список поездов на станции в данный момент
  def trains_on_station_at_that_moment
    time = Time.now
    p time, @name, @trains
  end
 #вывод списка на станции по типу. 
  def trains_list(type)
    @trains.select { |train|  train if train.type == type }
  end
#отправление поезда со станции    
  def depart_train(train)
    @trains.delete(train)
  end
end
