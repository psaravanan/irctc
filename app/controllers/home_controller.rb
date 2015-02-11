class HomeController < ApplicationController
before_filter :set_erail_key

# Trains
# Fares

# Pnr status
# rail_in.live_status(train_no, station_from, date)
# rail_in.seat_availability(train_no, station_from, station_to, quota, class, date)
# rail_in.train_at_station(station_from, station_to, hour)
  def pnr_status
    @title = "PNR Status"
    if params[:pnr_number]
      # 4404478884
      @pnr_status = @rail_in.pnr_status(params[:pnr_number])
    end
  end

  def stations
    @title = "Stations"
    @stations = Station.get_stations
    respond_to do |format|
      format.html { render :stations }
      # format.json { render :show, status: :created, location: @contact_u }
      format.json { render json: @stations.map {|s| { label: s.station_name, value: s.station_name, code: s.code, name: s.name }} }
    end
  end

  def ticket_fare
    @title = "Ticket Fare"
    @stations = Station.get_stations.limit(100)
    if params[:search]
      @date = params[:search][:date]
      @station_from = params[:search][:from]
      @station_to = params[:search][:to]
      p @trains = @rail_in.trains(@station_from, @station_to)
    elsif params[:train]
      @date = params[:train][:date]
      @train_no = params[:train][:train_no]
      @class_code = params[:commit]
      @from = params[:train][:from]
      @to = params[:train][:to]
      p "ticket_fare"
      p url = "http://api.erail.in/fare/?key=#{ERAILKEY}&trainno=#{@train_no}&stnfrom=#{@from}&stnto=#{@to}&age=AD&quota=GN&date=#{@date}&class=#{@class_code}"
      @fare = JSON.parse(RestClient.get(url))
    elsif params[:passenger]
      class_code = params[:class_code]
      passengers = params[:passenger]
      date = params[:date]
      # p @fare = @rail_in.fare(params[:train_no], params[:from], params[:to], "24", "GN", date, class_code)

      # http://api.erail.in/fare/?key=fd3ebf59-3ed8-424f-a99d-5cfad4337d94&trainno=12138&stnfrom=NDLS&stnto=CSTM&age=AD&quota=GN&date=22-FEB-2015&class=SL
      # http://api.erail.in/fare/?key=fd3ebf59-3ed8-424f-a99d-5cfad4337d94&trainno=12661&stnfrom=MSdd&stnto=TTLd&age=AD&quota=GN&class=SL&date=15-FEB-2015
      render :fare
      # {"status"=>"OK", "result"=>{"trainno"=>"12662", "type"=>nil, "from"=>"TTL", "to"=>"MS", "age"=>"24", "quota"=>"GN", "date"=>"05-Mar-15", "fare"=>[{"cls"=>"", "fare"=>0}]}}
    end
  end

  def routes
    @title = "Route"
    if params[:train_no]
      @routes = @rail_in.route(params[:train_no])
    end
  end

  private

  def set_erail_key
    @rail_in = RailIn.new(ERAILKEY)
  end

end
