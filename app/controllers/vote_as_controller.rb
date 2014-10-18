class VoteAsController < ApplicationController
  before_action :set_vote_a, only: [:destroy]
  validates_presence_of :user_id, :question_id
  before_filter :signed_in_or_redirect
  # GET /vote_as
  # GET /vote_as.json
  # def index
  #   @vote_as = VoteA.all
  # end

  # # GET /vote_as/1
  # # GET /vote_as/1.json
  # def show
  # end

  # # GET /vote_as/new
  # def new
  #   @vote_a = VoteA.new
  # end

  # # GET /vote_as/1/edit
  # def edit
  # end

  # POST /vote_as
  # POST /vote_as.json
  def create
    @vote_a = VoteA.new(vote_a_params)
    @vote_a.user_id = current_user.id

    respond_to do |format|
      if @vote_a.save
        format.html { redirect_to @vote_a, notice: 'Vote a was successfully created.' }
        format.json { render :show, status: :created, location: @vote_a }
      else
        format.html { render :new }
        format.json { render json: @vote_a.errors, status: :unprocessable_entity }
      end
    end
  end

  # # PATCH/PUT /vote_as/1
  # # PATCH/PUT /vote_as/1.json
  # def update
  #   respond_to do |format|
  #     if @vote_a.update(vote_a_params)
  #       format.html { redirect_to @vote_a, notice: 'Vote a was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @vote_a }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @vote_a.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /vote_as/1
  # DELETE /vote_as/1.json
  def destroy
    @vote_a.destroy
    respond_to do |format|
      format.html { redirect_to vote_as_url, notice: 'Vote a was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote_a
      @vote_a = VoteA.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_a_params
      params.require(:vote_a).permit(:user_id, :question_id)
    end
end
