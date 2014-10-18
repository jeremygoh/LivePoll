require 'test_helper'

class PollCentresControllerTest < ActionController::TestCase
  setup do
    @poll_centre = poll_centres(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:poll_centres)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create poll_centre" do
    assert_difference('PollCentre.count') do
      post :create, poll_centre: { title: @poll_centre.title }
    end

    assert_redirected_to poll_centre_path(assigns(:poll_centre))
  end

  test "should show poll_centre" do
    get :show, id: @poll_centre
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @poll_centre
    assert_response :success
  end

  test "should update poll_centre" do
    patch :update, id: @poll_centre, poll_centre: { title: @poll_centre.title }
    assert_redirected_to poll_centre_path(assigns(:poll_centre))
  end

  test "should destroy poll_centre" do
    assert_difference('PollCentre.count', -1) do
      delete :destroy, id: @poll_centre
    end

    assert_redirected_to poll_centres_path
  end
end
