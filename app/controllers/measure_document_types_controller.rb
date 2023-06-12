class MeasureDocumentTypesController < ApplicationController
  before_action :set_measure_document_type, only: [:show, :edit, :update, :destroy]

  # GET /measure_document_types
  # GET /measure_document_types.json
  def index
    authorize! :show, MeasureDocumentType
    
    @measure_document_types = MeasureDocumentType.all
  end

  # GET /measure_document_types/1
  # GET /measure_document_types/1.json
  def show
    authorize! :show, MeasureDocumentType
    
  end

  # GET /measure_document_types/new
  def new
    authorize! :manage, MeasureDocumentType
    
    @measure_document_type = MeasureDocumentType.new
  end

  # GET /measure_document_types/1/edit
  def edit
    authorize! :manage, MeasureDocumentType
    
  end

  # POST /measure_document_types
  # POST /measure_document_types.json
  def create
    authorize! :manage, MeasureDocumentType
    
    @measure_document_type = MeasureDocumentType.new(measure_document_type_params)
    begin
      @measure_document_type.save
      redirect_to @measure_document_type.measure, notice: 'Measure document type was successfully created.'
    rescue ActiveRecord::RecordNotUnique => e
      redirect_to @measure_document_type.measure, alert: 'This document type is already in the template'
    rescue Exception => e
      redirect_to @measure_document_type.measure, alert: e.message
    end    
  end

  # PATCH/PUT /measure_document_types/1
  # PATCH/PUT /measure_document_types/1.json
  def update
    authorize! :manage, MeasureDocumentType
    
    respond_to do |format|
      if @measure_document_type.update(measure_document_type_params)
        format.html { redirect_to @measure_document_type, notice: 'Measure document type was successfully updated.' }
        format.json { render :show, status: :ok, location: @measure_document_type }
      else
        format.html { render :edit }
        format.json { render json: @measure_document_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /measure_document_types/1
  # DELETE /measure_document_types/1.json
  def destroy
    authorize! :manage, MeasureDocumentType
    
    @measure_document_type.destroy
    respond_to do |format|
      format.html { redirect_to @measure_document_type.measure, notice: 'Measure document type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_measure_document_type
      @measure_document_type = MeasureDocumentType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def measure_document_type_params
      params.permit(:document_type_id, :measure_id)
    end
end
