class EnterScoresController < ApplicationController
  before_action :set_enter_score, only: [:show, :edit, :update, :destroy]

  # GET /enter_scores
  # GET /enter_scores.json
  def index
    @enter_scores = EnterScore.all
  end

  # GET /enter_scores/1
  # GET /enter_scores/1.json
  def show
  end

  # GET /enter_scores/new
  def new
    @enter_score = EnterScore.new


  end

  # GET /enter_scores/1/edit
  def edit
  end

  # POST /enter_scores
  # POST /enter_scores.json
  def create
    @enter_score = EnterScore.new(enter_score_params)

    respond_to do |format|
      if @enter_score.save
        format.html { redirect_to @enter_score, notice: 'Score was successfully entered.' }
        format.json { render :show, status: :created, location: @enter_score }
      else
        format.html { render :new }
        format.json { render json: @enter_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enter_scores/1
  # PATCH/PUT /enter_scores/1.json
  def update
    respond_to do |format|
      if @enter_score.update(enter_score_params)
        format.html { redirect_to @enter_score, notice: 'Score was successfully updated.' }
        format.json { render :show, status: :ok, location: @enter_score }
      else
        format.html { render :edit }
        format.json { render json: @enter_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enter_scores/1
  # DELETE /enter_scores/1.json
  def destroy
    @enter_score.destroy
    respond_to do |format|
      format.html { redirect_to enter_scores_url, notice: 'Score was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enter_score
      @enter_score = EnterScore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enter_score_params
      params[:enter_score]
    end
end
