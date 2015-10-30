require 'test_helper'

class EventsControllerTest < ActionController::TestCase

	def setup
		@event = events(:event_one)
		@user = users(:lachlan)
		@user_not_admin = users(:chinami)
	end

	test "should get new" do
		log_in_as(@user)
		get :new
		assert flash.empty?
		assert_response :success
	end

end
