class Station < ActiveRecord::Base

  def self.get_name(code)
    get_record(code).try(:name)
  end

  def self.get_record(code)
    find_by_code code
  end

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
