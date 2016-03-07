class ScoresController < ApplicationController
  before_action :set_score, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:show, :index]
  # expose(:scores)
  # expose(:scores_descriptive_statistics) {User.all.extend(DescriptiveStatistics)}
  # # GET /scores
  # GET /scores.json
  def index                                         #Need LIFO stack format for table...
      
      @scores = Score.order("created_at DESC").take(5) 
      @score_user_id = params[:user_id]

      stat = Score.all.extend(DescriptiveStatistics)
      @variance = stat.variance(&:strokes) 
      @stDev = stat.standard_deviation(&:strokes) 
      # Median
      @median = stat.median(&:strokes)
      # 
      @map = stat.map(&:strokes) 
      if(:strokes == nil)
        @avg = 0
      else
        @avg = Score.average(:strokes)
        
      end
      
      @sample = 8-1

  end
  # 

  # GET /scores/1
  # GET /scores/1.json
  def show
  end

  # GET /scores/new
  def new
    @score = Score.new
  end

  # GET /scores/1/edit
  def edit
  end
  # def average
  #     User.average("strokes")
  #   end

  # POST /scores
  # POST /scores.json
  def create
    @score = Score.new(score_params)

    respond_to do |format|
      if @score.save
        format.html { redirect_to @score, notice: 'Score was successfully created.' }
        format.json { render :show, status: :created, location: @score }
      else
        format.html { render :new }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scores/1
  # PATCH/PUT /scores/1.json
  def update
    respond_to do |format|
      if @score.update(score_params)
        format.html { redirect_to @score, notice: 'Score was successfully updated.' }
        format.json { render :show, status: :ok, location: @score }
      else
        format.html { render :edit }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scores/1
  # DELETE /scores/1.json
  def destroy
    @score.destroy
    respond_to do |format|
      format.html { redirect_to scores_url, notice: 'Score was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_score
      @score = Score.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def score_params
      params.require(:score).permit(:strokes, :course, :image)
    end

end
