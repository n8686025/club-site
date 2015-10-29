require 'test_helper'

class EventTest < ActiveSupport::TestCase
  
  	# run before all tests
	def setup
		@event = Event.new(name: "Site created")
	end

	test "should be valid" do
		assert @event.valid?
	end

	# check if a attribute is not blank
	# set it to be " ", and then 
	# assert_not if it is returned as valid
	test "event name should not be blank" do
		@event.name = " "
		assert_not @event.valid?
	end

	# in event.rb min length of 5 set
	# make event name 4 char long
	# assert it is not valid
	test "event name should not be too short" do
		@event.name = "a" * 4
		assert_not @event.valid?
	end

end
