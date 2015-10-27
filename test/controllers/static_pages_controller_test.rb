require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Home | QUT Japan"
  end

  test "should get news" do
    get :news
    assert_response :success
    assert_select "title", "News | QUT Japan"
  end

  test "should get events" do
  	get :events
  	assert_response :success
  	assert_select "title", "Events | QUT Japan"
  end

end
