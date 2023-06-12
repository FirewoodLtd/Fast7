class ReviewEvidencesController < ApplicationController
  before_action :set_review_evidence, only: [:show, :edit, :update, :destroy]

  # GET /review_evidences
  # GET /review_evidences.json
  def index
    authorize! :show, ReviewEvidence
    
    @review_evidences = ReviewEvidence.all
  end

  # GET /review_evidences/1
  # GET /review_evidences/1.json
  def show
    authorize! :show, ReviewEvidence
    
  end

  # GET /review_evidences/new
  def new
    authorize! :manage, ReviewEvidence
    
    @review_evidence = ReviewEvidence.new
    @review_evidence.review_measure = ReviewMeasure.find(params[:review_measure_id]) if params.has_key?(:review_measure_id) 
  end

  # GET /review_evidences/1/edit
  def edit
    authorize! :manage, ReviewEvidence
    
  end

  # POST /review_evidences
  # POST /review_evidences.json
  def create
    authorize! :manage, ReviewEvidence
    
    @review_evidence = ReviewEvidence.new(review_evidence_params)

  begin
      respond_to do |format|
        if @review_evidence.save
          format.html { redirect_to review_measure_path(@review_evidence.review_measure), notice: 'Review evidence was successfully created.' }
          format.json { render :show, status: :created, location: @review_evidence }
        else
          format.html { render :new }
          format.json { render json: @review_evidence.errors, status: :unprocessable_entity }
        end
      end
  rescue => ex
     redirect_to review_measure_path(@review_evidence.review_measure), notice: 'Review evidence already exists' 
  end

  end

  # PATCH/PUT /review_evidences/1
  # PATCH/PUT /review_evidences/1.json
  def update
    authorize! :manage, ReviewEvidence
    
    respond_to do |format|
      if @review_evidence.update(review_evidence_params)
        format.html { redirect_to @review_evidence, notice: 'Review evidence was successfully updated.' }
        format.json { render :show, status: :ok, location: @review_evidence }
      else
        format.html { render :edit }
        format.json { render json: @review_evidence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /review_evidences/1
  # DELETE /review_evidences/1.json
  def destroy
    authorize! :manage, ReviewEvidence
    
    @review_evidence.destroy
    respond_to do |format|
      format.html { redirect_to edit_review_measure_path(@review_evidence.review_measure), notice: 'Review evidence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review_evidence
      @review_evidence = ReviewEvidence.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_evidence_params
      params.permit(
        :review_measure_id,
        :document_id
        )
    end
end
