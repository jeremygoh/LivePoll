class VoteCsController < ApplicationController
  before_action :set_vote_c, only: [:destroy]

  before_filter :signed_in_or_redirect

  # GET /vote_cs
  # GET /vote_cs.json
  # def index
  #   @vote_cs = VoteC.all
  # end

  # # GET /vote_cs/1
  # # GET /vote_cs/1.json
  # def show
  # end

  # # GET /vote_cs/new
  # def new
  #   @vote_c = VoteC.new
  # end

  # # GET /vote_cs/1/edit
  # def edit
  # end

  # POST /vote_cs
  # POST /vote_cs.json
  def create
    @vote_c = VoteC.new(vote_c_params)
    @vote_c.user_id = current_user.id

    respond_to do |format|
      if @vote_c.save
        format.html { redirect_to @vote_c, notice: 'Vote c was successfully created.' }
        format.json { render :show, status: :created, location: @vote_c }
      else
        format.html { render :new }
        format.json { render json: @vote_c.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vote_cs/1
  # PATCH/PUT /vote_cs/1.json
  # def update
  #   respond_to do |format|
  #     if @vote_c.update(vote_c_params)
  #       format.html { redirect_to @vote_c, notice: 'Vote c was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @vote_c }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @vote_c.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /vote_cs/1
  # DELETE /vote_cs/1.json
  def destroy
    redirect_to "/"
    # @vote_c.destroy
    # respond_to do |format|
    #   format.html { redirect_to vote_cs_url, notice: 'Vote c was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote_c
      @vote_c = VoteC.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_c_params
      params.require(:vote_c).permit(:user_id, :question_id)
    end
end
