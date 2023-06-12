class ReviewMeasuresController < ApplicationController
  before_action :set_review_measure, only: [:show, :edit, :update, :destroy, :get_guidance]
  
  # GET /review_measures
  # GET /review_measures.json
  def index
    authorize! :show, ReviewMeasure
    
    @review_measures = @review.review_measures
  end

  # GET /review_measures/1
  # GET /review_measures/1.json
  def show
    authorize! :show, ReviewMeasure
    
    add_recent_item(@review_measure)
    
    @temp=1
    @guidance = Hash.new('guidance')
    @review_measure.review.score.score_ranges.order(min: :asc).each do |r|
      for s in r.min..r.max do
        @guidance[s]=[r.name, 'test guidance super verbose']
      end
    end

  end

  # GET /review_measures/new
  def new
    authorize! :manage, ReviewMeasure
    
    @review_measure = ReviewMeasure.new
    @review_measure.review = @review
  end

  # GET /review_measures/1/edit
  def edit
    authorize! :manage, ReviewMeasure
    
    @score_options = []
    @review_measure.review.score.score_ranges.order(max: :desc).each do |range|
      @score_options << [
        range.min, 
        range.max,
        range.name,
        range.color
        ]
    end
  end

  # POST /review_measures
  # POST /review_measures.json
  def create
    authorize! :manage, ReviewMeasure
    
    @review_measure = ReviewMeasure.new(review_measure_params)
    @review_measure.user = current_user
    
    begin
      @review_measure.save
      redirect_to @review_measure, notice: 'Template updated'
    rescue ActiveRecord::RecordNotUnique => e
      redirect_to review_measures_path, alert: 'This measure is already in the template'
    rescue Exception => e
      redirect_to review_measures_path, alert: e.message
    end    
  end

  # PATCH/PUT /review_measures/1
  # PATCH/PUT /review_measures/1.json
  def update
    authorize! :manage, ReviewMeasure
    begin
      @review_measure.update(review_measure_params)
      redirect_to @review_measure, notice: 'Measure updated'
    rescue Exception => e
      redirect_to review_measures_path, alert: e.message
    end 
  end

  # DELETE /review_measures/1
  # DELETE /review_measures/1.json
  def destroy
    authorize! :manage, ReviewMeasure
    @review_measure.destroy
    respond_to do |format|
      format.html { redirect_to review_measures_path, notice: 'Review measure was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def get_guidance
    range= @review_measure.review.score.score_ranges.where(":score >= min", score: params[:score]).order(min: :desc).first
    val= {:name => range.name, :color => range.color, :guidance => @review_measure.measure.get_guidance(params[:score])}
    render :json => val
  end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review_measure
      @review_measure = ReviewMeasure.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_measure_params
      params.require(:review_measure).permit(
        :score,
        :is_enabled,
        :weight,
        :review_id,
        :measure_id
        )
    end
end
