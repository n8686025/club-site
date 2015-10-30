require 'test_helper'

class EventsEditTest < ActionDispatch::IntegrationTest
  
	def setup
		@event = events(:event_one)
		@user = users(:lachlan)
		@user_not_admin = users(:chinami)
	end

	# upon incorrect update, edit page should still be rendered
	test "unsuccessful edit because name too short" do
		log_in_as(@user)
		get edit_event_path(@event)
		patch event_path(@event), event: { name: "eee" }
		assert_not_equal name, @event.name
	end

	# submit correct edit
	# check for redirect
	# check for non empty flash
	# check info was updated in database
	test "successful edit by admin" do
		log_in_as(@user)
		get edit_event_path(@event)
		name = "Event edited name"
		patch event_path(@event), event: { name: name }
		assert_not flash.empty?
		@event.reload
		assert_equal name, @event.name
	end

	test "normal user cannot edit event" do 
		log_in_as(@user)
		get edit_event_path(@event)
		name = "Event edited name"
		patch event_path(@event), event: { name: name }
		assert_not flash.empty?
		@event.reload
		assert_equal name, @event.name

	end

end
