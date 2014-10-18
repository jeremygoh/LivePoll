class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy, :ask, :end_question]
  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        # format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render json: @question, status: :created, location: @question }
      else
        # format.html { render :new }
        format.json { render json: @question.errors, status: :bad_request }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :bad_request }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #ask a question
  #TO DO: make sure only owner of poll centre which question belongs to can ask a question
  def ask
    @poll_centre = PollCentre.find(@question.poll_centre_id)
    if @poll_centre.has_current_question?
      #then error
      output_error = {"error" => "There is a question currently in progress. Please wait for it to finish"}
      respond_to do |format|
        format.json { render json: output_error.to_json, status: :bad_request }
      end
    elsif @question.is_asked?
      output_error = {"error" => "Question already asked"}
      respond_to do |format|
        format.json { render json: output_error.to_json, status: :bad_request }
      end
    else
      @question.started = true
      if @question.save
        channel_name = @poll_centre.title
        Pusher["#{channel_name}"].trigger('question-start', {
          question_text: @question.text,
          option_a: @question.option_a,
          option_b: @question.option_b,
          option_c: @question.option_c,
          option_d: @question.option_d
        })
        respond_to do |format|
          format.json { render json: @question, status: :ok }
        end
      else
        output_error = {"error" => "Couldn't ask question. Please try again."}
        respond_to do |format|
          format.json { render json: output_error.to_json, status: :bad_request }
        end
      end
    end
  end

  def end_question
    if @question.is_live?
      @question.finished = true
      if @question.save
        channel_name = PollCentre.find(@question.poll_centre_id).title
        Pusher["#{channel_name}"].trigger('question-end', {
          question_text: @question.text,
          option_a: @question.option_a,
          option_b: @question.option_b,
          option_c: @question.option_c,
          option_d: @question.option_d,
          option_a_votes: @question.a_votes,
          option_b_votes: @question.b_votes,
          option_c_votes: @question.c_votes,
          option_d_votes: @question.d_votes,
          total_votes: @question.a_votes +  @question.b_votes + @question.c_votes + @question.d_votes,
          correct_answer: @question.correct_answer
        })
        respond_to do |format|
          format.json { render json: @question.results, status: :ok }
        end
        return
      end
    end

    output_error = {"error" => "Couldn't process your request to end the question."} # better error message needed for diff cases?
    respond_to do |format|
      format.json { render json: output_error.to_json, status: :bad_request }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:text, :option_a, :option_b, :option_c, :option_d, :started, :finished, :answer, :poll_centre_id)
    end
end
