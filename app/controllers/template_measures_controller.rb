class TemplateMeasuresController < ApplicationController
   before_action :set_template_measure, only: [:show, :edit, :update, :destroy]
    
  def create
    authorize! :manage, TemplateMeasure
    
    template= Template.find(params[:template_id])
    
    begin
      params[:template][:measures].each do |m|
        tm = TemplateMeasure.new()
        tm.template = template
        tm.measure = Measure.find(m)
        tm.save
      end      
      redirect_to template, notice: 'Template updated'
    rescue ActiveRecord::RecordNotUnique => e
      redirect_to template, alert: 'This measure is already in the template'
    rescue Exception => e
      redirect_to template, alert: e.message
    end
  end
  
  def destroy
    authorize! :manage, TemplateMeasure
    
    @template_measure.destroy
    redirect_to @template_measure.template, notice: 'Measure was successfully removed from this template'
  end  
  
  private
  
  def set_template_measure
    @template_measure = TemplateMeasure.find(params[:id])
  end  
  
  def template_measure_params
    params.permit(
      :template[:measures], 
      :template_id
      )
  end

end
