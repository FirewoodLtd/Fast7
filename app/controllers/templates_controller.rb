class TemplatesController < ApplicationController
  before_action :set_template, only: [:show, :edit, :update, :destroy]

  # GET /templates
  # GET /templates.json
  def index
    authorize! :show, ::Template
    
    @templates = current_user.customer.templates.order(:name)
  end

  # GET /templates/1
  # GET /templates/1.json
  def show
    authorize! :show, ::Template
    
    @template_measure=TemplateMeasure.new
    @template_measure.template=@template
  end

  # GET /templates/new
  def new
    authorize! :show, ::Template
    
    @template = Template.new
  end

  # GET /templates/1/edit
  def edit
    authorize! :show, ::Template
    
    @measures = [] 
    current_user.customer.categories.each do |framework|
      framework.all_measures.order(:name).each do |m|
        @measures << m
      end
    end
  
  end

  # POST /templates
  # POST /templates.json
  def create
    authorize! :show, ::Template
    
     @template = Template.new(template_params)
      begin
         @template.save
         current_user.customer.templates << @template
         
         redirect_to @template, notice: 'Template created'
      rescue ActiveRecord::RecordNotUnique => e
         redirect_to @template, alert: 'Template name already exists, please use a different name'
      rescue Exception => e
         redirect_to @template, alert: e.message
      end    
  end

  # PATCH/PUT /templates/1
  # PATCH/PUT /templates/1.json
  def update
    authorize! :show, ::Template
    
    begin
       @template.update(template_params)
       redirect_to @template, notice: 'Template updated'
    rescue Exception => e
       redirect_to @template, alert: e.message
    end     
  end

  # DELETE /templates/1
  # DELETE /templates/1.json
  def destroy
    authorize! :show, ::Template
    
    @template.destroy
    respond_to do |format|
      format.html { redirect_to templates_url, notice: 'Template was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_template
      @template = ::Template.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def template_params
      params.require(:template).permit(
        :name, 
        :description, 
        :measure_ids => []
        )
    end
end
