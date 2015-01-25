class HomeController < ApplicationController
  
  def index
    if params[:pnr_number]
      @rail_in = RailIn.new(ERAILKEY)
      # 4404478884
      # @pnr_status = @rail_in.pnr_status(params[:pnr_number])
      @pnr_status = {"status"=>"OK", "result"=>{"pnr"=>"4404478884", "cls"=>"SL", "eticket"=>true, "journey"=>"25-Jan-2015", "trainno"=>"12661", "name"=>"POTHIGAI EXP", "from"=>"MS", "to"=>"TTL", "brdg"=>"MS", "passengers"=>[{"bookingstatus"=>"W/L 4CK", "currentstatus"=>"Confirmed", "coach"=>""}, {"bookingstatus"=>"W/L 5CK", "currentstatus"=>"Confirmed", "coach"=>""}], "chart"=>"CHART NOT PREPARED", "error"=>""}}
    end
  end

  def station_lists
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
    end
  end

end
