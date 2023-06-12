class FindingsController < ApplicationController
  before_action :set_finding, only: [:show, :edit, :update, :destroy]

  # GET /findings
  # GET /findings.json
  def index
    authorize! :show, Finding
    
    @findings = @review.findings
  end

  # GET /findings/1
  # GET /findings/1.json
  def show
    authorize! :show, Finding
    
    add_recent_item(@finding)
  end

  # GET /findings/new
  def new
    authorize! :manage, Finding
    
    @finding = Finding.new
    @finding.review_measure = @review.review_measures.first
    @finding.review_measure = ReviewMeasure.find(params[:review_measure_id]) if params.has_key?(:review_measure_id) 
  end

  # GET /findings/1/edit
  def edit
    authorize! :manage, Finding
    
  end

  # POST /findings
  # POST /findings.json
  def create
    authorize! :manage, Finding
    
    @finding = Finding.new(finding_params)

    respond_to do |format|
      if @finding.save
        format.html { redirect_to findings_path, notice: 'Finding was successfully created.' }
        format.json { render :show, status: :created, location: @finding }
      else
        format.html { render :new }
        format.json { render json: @finding.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /findings/1
  # PATCH/PUT /findings/1.json
  def update
    authorize! :manage, Finding
    
    respond_to do |format|
      if @finding.update(finding_params)
        format.html { redirect_to  findings_path, notice: 'Finding was successfully updated.' }
        format.json { render :show, status: :ok, location: @finding }
      else
        format.html { render :edit }
        format.json { render json: @finding.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /findings/1
  # DELETE /findings/1.json
  def destroy
    authorize! :manage, Finding
    
    @finding.destroy
    respond_to do |format|
      format.html { redirect_to findings_path, notice: 'Finding was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_finding
      @finding = Finding.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def finding_params
      params.require(:finding).permit(
        :review_measure_id,
        :status_type_id,
        :user_id,
        :description,
        :is_agreed,
        :evidence,
        :concern,
        :implication,
        :recommendation,
        :comments,
        :comments_disposition
      )
    end
end
