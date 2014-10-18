require 'test_helper'

class VoteDsControllerTest < ActionController::TestCase
  setup do
    @vote_d = vote_ds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vote_ds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vote_d" do
    assert_difference('VoteD.count') do
      post :create, vote_d: { question_id: @vote_d.question_id, user_id: @vote_d.user_id }
    end

    assert_redirected_to vote_d_path(assigns(:vote_d))
  end

  test "should show vote_d" do
    get :show, id: @vote_d
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vote_d
    assert_response :success
  end

  test "should update vote_d" do
    patch :update, id: @vote_d, vote_d: { question_id: @vote_d.question_id, user_id: @vote_d.user_id }
    assert_redirected_to vote_d_path(assigns(:vote_d))
  end

  test "should destroy vote_d" do
    assert_difference('VoteD.count', -1) do
      delete :destroy, id: @vote_d
    end

    assert_redirected_to vote_ds_path
  end
end
