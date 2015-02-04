class HomeController < ApplicationController
  
  def pnr_status
    if params[:pnr_number]
      @rail_in = RailIn.new(ERAILKEY)
      # 4404478884
      p @pnr_status = @rail_in.pnr_status(params[:pnr_number])
      # @pnr_status = {"status"=>"OK", "result"=>{"pnr"=>"4404478884", "cls"=>"SL", "eticket"=>true, "journey"=>"25-Jan-2015", "trainno"=>"12661", "name"=>"POTHIGAI EXP", "from"=>"MS", "to"=>"TTL", "brdg"=>"MS", "passengers"=>[{"bookingstatus"=>"W/L 4CK", "currentstatus"=>"Confirmed", "coach"=>""}, {"bookingstatus"=>"W/L 5CK", "currentstatus"=>"Confirmed", "coach"=>""}], "chart"=>"CHART NOT PREPARED", "error"=>""}}
    end
  end

  def station_lists
    @station = Station.last
    if @station.nil?
      
    end
  @rail_in = RailIn.new(ERAILKEY)
  @stations = @rail_in.stations
  # @stations = {"status"=>"OK", "result"=>{"pnr"=>"4404478884", "cls"=>"SL", "eticket"=>true, "journey"=>"25-Jan-2015", "trainno"=>"12661", "name"=>"POTHIGAI EXP", "from"=>"MS", "to"=>"TTL", "brdg"=>"MS", "passengers"=>[{"bookingstatus"=>"W/L 4CK", "currentstatus"=>"Confirmed", "coach"=>""}, {"bookingstatus"=>"W/L 5CK", "currentstatus"=>"Confirmed", "coach"=>""}], "chart"=>"CHART NOT PREPARED", "error"=>""}}
  end

  def trains
    @rail_in = RailIn.new(ERAILKEY)
    @stations = @rail_in.stations
    if params[:search]
      @rail_in = RailIn.new(ERAILKEY)
      @station_from = params[:search][:from]
      @station_to = params[:search][:to]
      @trains = @rail_in.trains(@station_from, @station_to)
      # @trains = {"status"=>"OK", "result"=>[{"trainno"=>"12661", "name"=>"POTHIGAI EXP", "cls"=>"2A 3A SL", "rundays"=>"Daily", "from"=>"MS", "fromname"=>"Chennai Egmore", "dep"=>"20.55", "to"=>"TTL", "toname"=>"Tiruttangal", "arr"=>"06.34", "pantry"=>0, "type"=>"SUPERFAST", "datefrom"=>"25-Jan-2015", "dateto"=>"26-Jan-2020", "traveltime"=>"09.39"}]}
    end
  end

  def routes
    if params[:train_no]
      @rail_in = RailIn.new(ERAILKEY)
      @routes = @rail_in.route(params[:train_no])
    end
  end

  def ticket_fare
    
  end

end
