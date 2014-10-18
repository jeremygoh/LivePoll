class PollCentresController < ApplicationController
  before_action :set_poll_centre, only: [:edit, :update, :destroy]

  # GET /poll_centres
  # GET /poll_centres.json
  def index
    @poll_centres = PollCentre.all
  end

  # GET /poll_centres/1
  # GET /poll_centres/1.json
  def show_admin
    @poll_centre = PollCentre.find_by(title: params[:title])
    @question = Question.new
    @unasked_questions = @poll_centre.unasked_questions
    @current_question = @poll_centre.current_question
    @asked_questions = @poll_centre.asked_questions
  end

  def show
    #TO DO: if admin should redirect to admin version
    @poll_centre = PollCentre.find_by(title: params[:title])
  end

  # GET /poll_centres/new
  def new
    @poll_centre = PollCentre.new
  end

  # GET /poll_centres/1/edit
  def edit
  end

  # POST /poll_centres
  # POST /poll_centres.json
  def create
    @poll_centre = PollCentre.new(poll_centre_params)

    respond_to do |format|
      if @poll_centre.save
        format.html { redirect_to "/#{@poll_centre.title}/admin", notice: 'Poll centre was successfully created.' }
        format.json { render :show, status: :created, location: @poll_centre }
      else
        format.html { render :new }
        format.json { render json: @poll_centre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /poll_centres/1
  # PATCH/PUT /poll_centres/1.json
  def update
    respond_to do |format|
      if @poll_centre.update(poll_centre_params)
        format.html { redirect_to @poll_centre, notice: 'Poll centre was successfully updated.' }
        format.json { render :show, status: :ok, location: @poll_centre }
      else
        format.html { render :edit }
        format.json { render json: @poll_centre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /poll_centres/1
  # DELETE /poll_centres/1.json
  def destroy
    @poll_centre.destroy
    respond_to do |format|
      format.html { redirect_to poll_centres_url, notice: 'Poll centre was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poll_centre
      @poll_centre = PollCentre.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poll_centre_params
      params.require(:poll_centre).permit(:title)
    end
end
