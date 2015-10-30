class StaticPagesController < ApplicationController


  def home
  	
  end

  def news
  end

  def events
  	@events = Event.all
  end
  
  def contact
  end
  
end
