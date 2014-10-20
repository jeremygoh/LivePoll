class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  before_filter :signed_in_or_redirect
  before_filter :signed_in_or_redirect



  def vote
    @question = Question.find(params[:id])
    @vote_selection = params[:vote_letter]
    channel_name = PollCentre.find(@question.poll_centre_id).title
    @user = current_user
    question_id = params[:id]

    voted_already = @user.has_voted?(question_id)
    #if user has voted already, find and delete previous vote and create new one as per normal
    if voted_already
      VoteA.where(question_id: question_id, user_id: @user.id).destroy_all #refactor!!
      VoteB.where(question_id: question_id, user_id: @user.id).destroy_all
      VoteC.where(question_id: question_id, user_id: @user.id).destroy_all
      VoteD.where(question_id: question_id, user_id: @user.id).destroy_all
    end

    if @vote_selection == 'a'
      @vote = VoteA.new
      @vote.question_id = question_id
      @vote.user_id = @user.id
      if @vote.save
        output = {"ok" => "Vote recorded"}

        Pusher["#{channel_name}"].trigger('question-vote', {
          status: "ok"
        }) unless voted_already
        respond_to do |format|
          format.json { render json: output.to_json, status: :ok }
        end
      else
        output = {"error" => "Couldn't record vote."}
        respond_to do |format|
          format.json { render json: output.to_json, status: :bad_request }
        end
      end
    elsif @vote_selection == 'b'
      @vote = VoteB.new
      @vote.question_id = params[:id]
      @vote.user_id = @user.id
      if @vote.save
        output = {"ok" => "Vote recorded"}
        Pusher["#{channel_name}"].trigger('question-vote', {
          status: "ok"
        }) unless voted_already
        respond_to do |format|
          format.json { render json: output.to_json, status: :ok }
        end
      else
        output = {"error" => "Couldn't record vote."}
        respond_to do |format|
          format.json { render json: output.to_json, status: :bad_request }
        end
      end
    elsif @vote_selection == 'c'
      @vote = VoteC.new
      @vote.question_id = params[:id]
      @vote.user_id = @user.id
      if @vote.save
        output = {"ok" => "Vote recorded"}
        Pusher["#{channel_name}"].trigger('question-vote', {
          status: "ok"
        }) unless voted_already
        respond_to do |format|
          format.json { render json: output.to_json, status: :ok }
        end
      else
        output = {"error" => "Couldn't record vote."}
        respond_to do |format|
          format.json { render json: output.to_json, status: :bad_request }
        end
      end
    elsif @vote_selection == 'd'
      @vote = VoteD.new
      @vote.question_id = params[:id]
      @vote.user_id = @user.id
      if @vote.save
        output = {"ok" => "Vote recorded"}
        Pusher["#{channel_name}"].trigger('question-vote', {
          status: "ok"
        }) unless voted_already
        respond_to do |format|
          format.json { render json: output.to_json, status: :ok }
        end
      else
        output = {"error" => "Couldn't record vote."}
        respond_to do |format|
          format.json { render json: output.to_json, status: :bad_request }
        end
      end
    else
      output = {"error" => "Couldn't record vote. Malformed request"}
      respond_to do |format|
        format.json { render json: output.to_json, status: :bad_request }
      end
    end
  end
  # # GET /users
  # # GET /users.json
  def index
    # @users = User.all
        redirect_to "/"

  end

  # GET /users/1
  # # GET /users/1.json
  def show
        redirect_to "/"

  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    redirect_to "/"
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    redirect_to "/"
    # respond_to do |format|
    #   if @user.update(user_params)
    #     format.html { redirect_to @user, notice: 'User was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @user }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    redirect_to "/"
    # @user.destroy
    # respond_to do |format|
    #   format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
