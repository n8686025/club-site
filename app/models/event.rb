class Event < ActiveRecord::Base
	# to validate presence of an attribute
	validates :name, presence: true, length: { minimum: 5} 

end
