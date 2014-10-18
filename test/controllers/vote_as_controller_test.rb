require 'test_helper'

class VoteAsControllerTest < ActionController::TestCase
  setup do
    @vote_a = vote_as(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vote_as)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vote_a" do
    assert_difference('VoteA.count') do
      post :create, vote_a: { question_id: @vote_a.question_id, user_id: @vote_a.user_id }
    end

    assert_redirected_to vote_a_path(assigns(:vote_a))
  end

  test "should show vote_a" do
    get :show, id: @vote_a
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vote_a
    assert_response :success
  end

  test "should update vote_a" do
    patch :update, id: @vote_a, vote_a: { question_id: @vote_a.question_id, user_id: @vote_a.user_id }
    assert_redirected_to vote_a_path(assigns(:vote_a))
  end

  test "should destroy vote_a" do
    assert_difference('VoteA.count', -1) do
      delete :destroy, id: @vote_a
    end

    assert_redirected_to vote_as_path
  end
end
