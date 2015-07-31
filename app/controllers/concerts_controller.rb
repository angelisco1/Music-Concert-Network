class ConcertsController < ApplicationController

	def index
		@concerts = Concert.get_events_today
	end

	def new
		@concert = Concert.new
	end

	def create
		@concert = Concert.new concert_params
		if @concert.save
			redirect_to concerts_path
		else
			@errors = @concert.errors.full_messages
			render 'new'
		end
	end

	def show
		@concert = Concert.get_concert params[:id]
	end

	private
	def concert_params
		return params.require(:concert).permit(:band, :venue, :city, :date, :price, :description)
	end

end