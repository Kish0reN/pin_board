class PinsController < ApplicationController
  def index
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

private

	def pin_params

		params.require(:pin).permit(:title, :description)
	end

end
