class Station < ActiveRecord::Base

  def self.get_stations
    if last.nil?
      stations = @rail_in.stations
      store_stations(stations)
    end
    all
  end

  def store_stations(stations)
    transaction do
      stations.each do |station|
        Station.create!(station)
      end
    end
  end
end
