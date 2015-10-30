require 'test_helper'

class EventsCreateTest < ActionDispatch::IntegrationTest
  
	test "Invalid event can't be created" do
		get create_event_path
		assert_no_difference 'Event.count' do
			post events_path, event: { name: " " }
		end
		assert_template 'events/new'
	end

	# create event, see if count increased by 1
	test "Valid event is created" do
		get create_event_path
		assert_difference 'Event.count', 1 do
			post_via_redirect events_path, event: { name: "My Test Event" }
		end
		assert_template 'events/show'
	end

end
