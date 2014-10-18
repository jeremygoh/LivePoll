class VoteDsController < ApplicationController
  before_action :set_vote_a, only: [:destroy]
  validates_presence :user_id, :question_id
  before_filter :signed_in_or_redirect

  # GET /vote_ds
  # # GET /vote_ds.json
  # def index
  #   @vote_ds = VoteD.all
  # end

  # # GET /vote_ds/1
  # # GET /vote_ds/1.json
  # def show
  # end

  # # GET /vote_ds/new
  # def new
  #   @vote_d = VoteD.new
  # end

  # # GET /vote_ds/1/edit
  # def edit
  # end

  # POST /vote_ds
  # POST /vote_ds.json
  def create
    @vote_d = VoteD.new(vote_d_params)
    @vote_d.user_id = current_user.id

    respond_to do |format|
      if @vote_d.save
        format.html { redirect_to @vote_d, notice: 'Vote d was successfully created.' }
        format.json { render :show, status: :created, location: @vote_d }
      else
        format.html { render :new }
        format.json { render json: @vote_d.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vote_ds/1
  # PATCH/PUT /vote_ds/1.json
  # def update
  #   respond_to do |format|
  #     if @vote_d.update(vote_d_params)
  #       format.html { redirect_to @vote_d, notice: 'Vote d was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @vote_d }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @vote_d.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /vote_ds/1
  # DELETE /vote_ds/1.json
  def destroy
    @vote_d.destroy
    respond_to do |format|
      format.html { redirect_to vote_ds_url, notice: 'Vote d was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote_d
      @vote_d = VoteD.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_d_params
      params.require(:vote_d).permit(:user_id, :question_id)
    end
end
