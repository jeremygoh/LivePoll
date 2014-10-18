require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  setup do
    @question = questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create question" do
    assert_difference('Question.count') do
      post :create, question: { finished: @question.finished, option_a: @question.option_a, option_b: @question.option_b, option_c: @question.option_c, option_d: @question.option_d, poll_centre_id: @question.poll_centre_id, started: @question.started, text: @question.text }
    end

    assert_redirected_to question_path(assigns(:question))
  end

  test "should show question" do
    get :show, id: @question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @question
    assert_response :success
  end

  test "should update question" do
    patch :update, id: @question, question: { finished: @question.finished, option_a: @question.option_a, option_b: @question.option_b, option_c: @question.option_c, option_d: @question.option_d, poll_centre_id: @question.poll_centre_id, started: @question.started, text: @question.text }
    assert_redirected_to question_path(assigns(:question))
  end

  test "should destroy question" do
    assert_difference('Question.count', -1) do
      delete :destroy, id: @question
    end

    assert_redirected_to questions_path
  end
end
