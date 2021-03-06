class PinsController < ApplicationController
	before_action :find_pin, only: [:show,:edit,:update,:destroy]
  def index
  	@pins=Pin.all.order("created_at DESC")
  end

  def new
  	@pin=Pin.new
  end

  def create

	  	@pin=Pin.new(pin_params)

	  	if @pin.save
	  		flash[:success] = 'Successfully saved your Pin'
	  		redirect_to pins_path
	  	else
	  		flash[:danger] = 'Error occured'
	  		render new_pin_path
	  	end
  end

  def show
  end
  def update
  end
  def edit
  end
  def destroy
  end

private

	def pin_params

		params.require(:pin).permit(:title, :description)
	end

	def find_pin
		@pin=Pin.find(params[:id])
	end
end
