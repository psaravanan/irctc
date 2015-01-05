class HomeController < ApplicationController
  def index
  	if params[:pnr_number]
  		@rail_in = RailIn.new(ERAILKEY)
  		@pnr_status = @rail_in.pnr_status(params[:pnr_number])
  	end
  end
end
