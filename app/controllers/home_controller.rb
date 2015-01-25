class HomeController < ApplicationController
  def index
  	if params[:pnr_number]
  		@rail_in = RailIn.new(ERAILKEY)
  		# 4404478884
  		# @pnr_status = @rail_in.pnr_status(params[:pnr_number])
  		@pnr_status = {"status"=>"OK", "result"=>{"pnr"=>"4404478884", "cls"=>"SL", "eticket"=>true, "journey"=>"25-Jan-2015", "trainno"=>"12661", "name"=>"POTHIGAI EXP", "from"=>"MS", "to"=>"TTL", "brdg"=>"MS", "passengers"=>[{"bookingstatus"=>"W/L 4CK", "currentstatus"=>"Confirmed", "coach"=>""}, {"bookingstatus"=>"W/L 5CK", "currentstatus"=>"Confirmed", "coach"=>""}], "chart"=>"CHART NOT PREPARED", "error"=>""}}
  	end
  end
end
