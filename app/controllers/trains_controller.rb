class TrainsController < ApplicationController

	def index
		@trains = Train.get_trains
	end

end