require 'test_helper'

class VoteCsControllerTest < ActionController::TestCase
  setup do
    @vote_c = vote_cs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vote_cs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vote_c" do
    assert_difference('VoteC.count') do
      post :create, vote_c: { question_id: @vote_c.question_id, user_id: @vote_c.user_id }
    end

    assert_redirected_to vote_c_path(assigns(:vote_c))
  end

  test "should show vote_c" do
    get :show, id: @vote_c
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vote_c
    assert_response :success
  end

  test "should update vote_c" do
    patch :update, id: @vote_c, vote_c: { question_id: @vote_c.question_id, user_id: @vote_c.user_id }
    assert_redirected_to vote_c_path(assigns(:vote_c))
  end

  test "should destroy vote_c" do
    assert_difference('VoteC.count', -1) do
      delete :destroy, id: @vote_c
    end

    assert_redirected_to vote_cs_path
  end
end
