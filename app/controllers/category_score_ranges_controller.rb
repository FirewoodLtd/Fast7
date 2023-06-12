class CategoryScoreRangesController < ApplicationController
   before_action :set_category_score_range, only: [:show, :edit, :update, :destroy]
    
  def create
    authorize! :manage, CategoryScoreRange
     
    @category_score_range= CategoryScoreRange.new(category_score_range_params)
    
    begin
      @category_score_range.save
      redirect_to edit_category_path(@category_score_range.category), notice: 'Category guidance updated'
    rescue ActiveRecord::RecordNotUnique => e
      redirect_to edit_category_path(@category_score_range.category), alert: 'This score range already has guidance'
    rescue Exception => e
      redirect_to edit_category_path(@category_score_range.category), alert: e.message
    end
  end
  
  def destroy
    authorize! :manage, CategoryScoreRange
     
    @category_score_range.destroy
    redirect_to edit_category_path(@category_score_range.category), notice: 'Guidance was successfully removed'
  end  
  
  private
  
  def set_category_score_range
    @category_score_range = CategoryScoreRange.find(params[:id])
  end  
  
  def category_score_range_params
    params.permit(
      :category_id, 
      :score_range_id,
      :description
      )
  end
end
