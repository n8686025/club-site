class EventsController < ApplicationController
  before_action :admin_present, only: [:new, :edit, :update]
	before_action :user_present, only: [:new, :edit, :update]


  # check if current user is an admin
  # only admin can make event etc
  def admin_present
    unless current_user.admin?
      flash[:danger] = "Please log in"
      redirect_to login_url
    end
  end

  def user_present
  	unless current_user.present?
 
  		flash[:danger] = "Please log in"
  		redirect_to login_url
  	end	
  end

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

  def edit
  	@event = Event.find(params[:id])
  	
  end

  def update
  	@event = Event.find(params[:id])
  	if @event.update_attributes(event_params)
  		flash[:success] = "Event information updated"
  		redirect_to @event
  	else
  		render 'edit'
  	end
  end

  private

  	def event_params
  		params.require(:event).permit(:name)
  	end
 
end
