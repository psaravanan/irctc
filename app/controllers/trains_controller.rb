class TrainsController < ApplicationController

	def index
		@title = "Trains"
		@trains = Train.get_trains
	end

end