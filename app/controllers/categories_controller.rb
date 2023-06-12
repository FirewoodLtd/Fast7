class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    authorize! :show, Category
    @categories = Category.roots.order(name: :asc)
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    authorize! :show, Category
  end

  # GET /categories/new
  def new
    authorize! :manage, Category
    
    @category = Category.new
    @category.parent = Category.find(params[:category_id]) if params.has_key?(:category_id) 
  end

  # GET /categories/1/edit
  def edit
    authorize! :manage, Category
    
  end

  # POST /categories
  # POST /categories.json
  def create
    authorize! :manage, Category
    
    category = Category.new(category_params)
    
    begin
      category.save     
      redirect_to category, notice: 'Category was successfully created'
    rescue ActiveRecord::RecordNotUnique => e
      redirect_to category, alert: 'This category already exists'
    rescue Exception => e
      redirect_to category, alert: e.message
    end

  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    authorize! :manage, Category
    
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    authorize! :manage, Category
    
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(
        :name,
        :code,
        :parent_id
        )
    end
end
