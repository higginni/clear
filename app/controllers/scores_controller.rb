class ScoresController < ApplicationController
  before_action :set_score, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:show, :index]
 
  def index  
    respond_to do |format|
      format.html { 
        # Display current users scores in the order of created at descending from most recent. Taking the last 5 scores
        @scores = current_user.scores.paginate(:page => params[:page], :per_page => 3).reverse_order

        # @scores = Content.paginate(:page => params[:page], :per_page => 5).reverse_order
        
        @score_user_id = params[:user_id]
      
        # Stats Work 
        stat = current_user.scores.all.extend(DescriptiveStatistics)

        @variance = stat.variance(&:strokes) 
        
        @stDev = stat.standard_deviation(&:strokes) 
        
        @median = stat.median(&:strokes)
        @map = stat.map(&:strokes) 
        @range = stat.range(&:strokes)
        # error handling in case strokes is empty - new user.
        if(:strokes == nil)
          @avg = 0
        else
          @avg = current_user.scores.average(:strokes)   
        end     
        @sample = 8-1
        
      }
      format.json { 
        scores = current_user.scores
        # 
        render :json => scores
      }
    end

  end

  def show
  end

  # GET /scores/new
  # setting new score
  def new
    @score = Score.new
  end

  # GET /scores/1/edit
  def edit
  end
 

  # POST /scores
  # POST /scores.json
  # create scores
  def create
    @score = Score.new(score_params)
    @score.user_id = current_user.id

    respond_to do |format|
      if @score.save
        format.html { redirect_to @score, notice: 'Score was successfully CREATED.' }
        format.json { render :show, status: :created, location: @score }
      else
        format.html { render :new }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scores/1
  # PATCH/PUT /scores/1.json
  # updating scores
  def update
    respond_to do |format|
      if @score.update(score_params)
        format.html { redirect_to @score, notice: 'Score was successfully UPDATED.' }
        format.json { render :show, status: :ok, location: @score }
      else
        format.html { render :edit }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scores/1
  # DELETE /scores/1.json
  # deleting scores
  def destroy
    @score.destroy
    respond_to do |format|
      format.html { redirect_to scores_url, notice: 'Score was successfully DESTROYED.' }
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
