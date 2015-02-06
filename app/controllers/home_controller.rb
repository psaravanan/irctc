class HomeController < ApplicationController
before_filter :set_erail_key

# Trains
# Fares

# Pnr status
# rail_in.live_status(train_no, station_from, date)
# rail_in.seat_availability(train_no, station_from, station_to, quota, class, date)
# rail_in.train_at_station(station_from, station_to, hour)

  def pnr_status
    if params[:pnr_number]
      # 4404478884
      p @pnr_status = @rail_in.pnr_status(params[:pnr_number])
    end
  end

  def stations
    @stations = Station.get_stations
  end

  def trains
    @stations = Station.get_stations
    if params[:search]
      @station_from = params[:search][:from]
      @station_to = params[:search][:to]
      @trains = @rail_in.trains(@station_from, @station_to)
    elsif params[:train]
      @train_no = params[:train][:train_no]
      @from = params[:train][:from]
      @to = params[:train][:to]
    elsif params[:passenger]
      passengers = params[:passenger]
      # age = params[:train_no]
      date = params[:date]
      p @fare = @rail_in.fare(params[:train_no], params[:from], params[:to], "24", "GN", date)
    end
  end

  def routes
    if params[:train_no]
      @routes = @rail_in.full_route(params[:train_no])
    end
  end

  def ticket_fare
    @fare = @rail_in.fare(train_no, station_from, station_to, age, quota, date)
  end

  private

  def set_erail_key
    @rail_in = RailIn.new(ERAILKEY)
  end

end
