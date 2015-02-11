class TrainsController < ApplicationController

	def index
		@title = "Trains"
		@trains = Train.get_trains
	    respond_to do |format|
	      format.html { render :index }
	      # format.json { render :show, status: :created, location: @contact_u }
	      format.json { render json: @trains.map {|t| { label: t.train_name, value: t.train_name, train_no: t.train_no, name: t.name }} }
	    end

	end

end