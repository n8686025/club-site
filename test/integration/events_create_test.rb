require 'test_helper'

class EventsCreateTest < ActionDispatch::IntegrationTest

	def setup
		@event = events(:event_one)
		@user = users(:lachlan)
		@user_not_admin = users(:chinami)
	end
  
	test "Invalid event can't be created" do
		log_in_as(@user)
		get create_event_path
		assert_no_difference 'Event.count' do
			post events_path, event: { name: " " }
		end
		assert_template 'events/new'
	end

	# create event, see if count increased by 1
	test "Valid event is created" do
		log_in_as(@user)
		get create_event_path
		assert_difference 'Event.count', 1 do
			post_via_redirect events_path, event: { name: "My Test Event" }
		end
		assert_template 'events/show'
	end

end
