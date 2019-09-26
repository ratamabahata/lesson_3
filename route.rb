class Route
  attr_reader :stations
 #создание первых и последних станций 
  def initialize(first, last)
  	@path = [first, last]
  end
#добавление новых станций
  def add_station(station)
    @stations.insert(-2, station)
  end
#удаление станций
  def delete_station(station)
    @stations.delete(station)
  end
#ввывод списка станций
def station_list
    @stations.each do |sp|
      puts sp
    end

end
end
