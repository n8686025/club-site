class EventsController < ApplicationController
  def new
  	# create Event object as argument for form_for
  	@event = Event.new 
  end

  def show 
  	@event = Event.find(params[:id]) # retreive id
  end

  def create
  	@event = Event.new(event_params) 
  	if @event.save
  		# Handle succesful save
  		flash[:success] = "Event " + @event.name + " was created!" 
  		redirect_to @event
  	else
  		render 'new' # events#new page (with flash)
  	end
  end

  private

  	def event_params
  		params.require(:event).permit(:name)
  	end

end
