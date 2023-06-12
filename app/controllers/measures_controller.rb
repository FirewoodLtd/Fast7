class MeasuresController < ApplicationController
  before_action :set_measure, only: [:show, :edit, :update, :destroy]

  # GET /measures
  # GET /measures.json
  def index
    authorize! :show, Measure
    
    redirect_to categories_path
  end

  # GET /measures/1
  # GET /measures/1.json
  def show
    authorize! :show, Measure
    
    
  end

  # GET /measures/new
  def new
    authorize! :manage, Measure
    
    @measure = Measure.new
    @measure.category = Category.find(params[:category_id]) if params.has_key?(:category_id) 
  end

  # GET /measures/1/edit
  def edit
    authorize! :manage, Measure
    
  end

  # POST /measures
  # POST /measures.json
  def create
    authorize! :manage, Measure
    
    @measure = Measure.new(measure_params)

    respond_to do |format|
      if @measure.save
        format.html { redirect_to @measure, notice: 'Measure was successfully created.' }
        format.json { render :show, status: :created, location: @measure }
      else
        format.html { render :new }
        format.json { render json: @measure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /measures/1
  # PATCH/PUT /measures/1.json
  def update
    authorize! :manage, Measure
    
    respond_to do |format|
      if @measure.update(measure_params)
        format.html { redirect_to @measure, notice: 'Measure was successfully updated.' }
        format.json { render :show, status: :ok, location: @measure }
      else
        format.html { render :edit }
        format.json { render json: @measure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /measures/1
  # DELETE /measures/1.json
  def destroy
    authorize! :manage, Measure
    
    @measure.destroy
    respond_to do |format|
      format.html { redirect_to @measure, notice: 'Measure was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_measure
      @measure = Measure.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def measure_params
      params.require(:measure).permit(
        :category_id,
        :name,
        :description,
        :code
        )
    end
end
