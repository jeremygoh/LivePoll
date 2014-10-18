require 'test_helper'

class VoteBsControllerTest < ActionController::TestCase
  setup do
    @vote_b = vote_bs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vote_bs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vote_b" do
    assert_difference('VoteB.count') do
      post :create, vote_b: { question_id: @vote_b.question_id, user_id: @vote_b.user_id }
    end

    assert_redirected_to vote_b_path(assigns(:vote_b))
  end

  test "should show vote_b" do
    get :show, id: @vote_b
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vote_b
    assert_response :success
  end

  test "should update vote_b" do
    patch :update, id: @vote_b, vote_b: { question_id: @vote_b.question_id, user_id: @vote_b.user_id }
    assert_redirected_to vote_b_path(assigns(:vote_b))
  end

  test "should destroy vote_b" do
    assert_difference('VoteB.count', -1) do
      delete :destroy, id: @vote_b
    end

    assert_redirected_to vote_bs_path
  end
end
