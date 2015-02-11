class Station < ActiveRecord::Base

  def station_name
    "#{code} - #{name}"
  end

  def self.station_name(code)
    station = get_record(code)
    "#{station.try(:station_name)}"
  end

  def self.get_name(code)
    get_record(code).try(:name)
  end

  def self.get_record(code)
    find_by_code code
  end

  def self.get_stations
    if last.nil?
      @rail_in = RailIn.new(ERAILKEY)
      stations = @rail_in.stations
      store_stations(stations)
    end
    all
  end

  def self.store_stations(stations)
    transaction do
      stations.each do |station|
        Station.create!(station)
      end
    end
  end
end
