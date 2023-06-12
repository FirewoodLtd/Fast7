class EvidencesController < ApplicationController
  before_action :set_evidence, only: [:show, :edit, :update, :destroy]

  # GET /evidences
  # GET /evidences.json
  def index
    authorize! :show, Evidence
    
    @evidences = Evidence.all
  end

  # GET /evidences/1
  # GET /evidences/1.json
  def show
    authorize! :show, Evidence
    
  end

  # GET /evidences/new
  def new
    authorize! :manage, Evidence
    
    @evidence = Evidence.new
  end

  # GET /evidences/1/edit
  def edit
    authorize! :manage, Evidence
    
  end

  # POST /evidences
  # POST /evidences.json
  def create
    authorize! :manage, Evidence
    
    @evidence = Evidence.new(evidence_params)

    respond_to do |format|
      if @evidence.save
        format.html { redirect_to measure_path(@evidence.measure), notice: 'Measure evidence was successfully created.' }
        format.json { render :show, status: :created, location: @evidence }
      else
        format.html { render :new }
        format.json { render json: @evidence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evidences/1
  # PATCH/PUT /evidences/1.json
  def update
    authorize! :manage, Evidence
    
    respond_to do |format|
      if @evidence.update(evidence_params)
        format.html { redirect_to @evidence, notice: 'Measure evidence was successfully updated.' }
        format.json { render :show, status: :ok, location: @evidence }
      else
        format.html { render :edit }
        format.json { render json: @evidence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evidences/1
  # DELETE /evidences/1.json
  def destroy
    authorize! :manage, Evidence
    
    @evidence.destroy
    respond_to do |format|
      format.html { redirect_to @evidence.measure, notice: 'Measure evidence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evidence
      @evidence = Evidence.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def evidence_params
      params.permit(
        :measure_id,
        :name,
        :code
        )
    end
end
