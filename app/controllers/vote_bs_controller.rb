class VoteBsController < ApplicationController
  before_action :set_vote_b, only: [:destroy]

  before_filter :signed_in_or_redirect

  # GET /vote_bs
  # GET /vote_bs.json
  def index
    # @vote_bs = VoteB.all
        redirect_to "/"

  end

  # # GET /vote_bs/1
  # # GET /vote_bs/1.json
  def show
        redirect_to "/"

  end

  # # GET /vote_bs/new
  def new
        redirect_to "/"

    # @vote_b = VoteB.new
  end

  # # GET /vote_bs/1/edit
  def edit
        redirect_to "/"

  end

  # POST /vote_bs
  # POST /vote_bs.json
  def create
    @vote_b = VoteB.new(vote_b_params)
    @vote_b.user_id = current_user.id

    respond_to do |format|
      if @vote_b.save
        format.html { redirect_to @vote_b, notice: 'Vote b was successfully created.' }
        format.json { render :show, status: :created, location: @vote_b }
      else
        format.html { render :new }
        format.json { render json: @vote_b.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vote_bs/1
  # PATCH/PUT /vote_bs/1.json
  # def update
  #   respond_to do |format|
  #     if @vote_b.update(vote_b_params)
  #       format.html { redirect_to @vote_b, notice: 'Vote b was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @vote_b }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @vote_b.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def update
    redirect_to "/"
  end

  # DELETE /vote_bs/1
  # DELETE /vote_bs/1.json
  def destroy
    redirect_to "/"
    # @vote_b.destroy
    # respond_to do |format|
    #   format.html { redirect_to vote_bs_url, notice: 'Vote b was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote_b
      @vote_b = VoteB.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_b_params
      params.require(:vote_b).permit(:user_id, :question_id)
    end
end
