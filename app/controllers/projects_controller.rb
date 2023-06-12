class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  
  def index
    authorize! :show, Project
    
    @projects = current_user.customer.projects.order(:created_at).limit(current_user.customer.max_projects)
    
  end

  def show
    authorize! :show, Project
    
  end

  def new
    authorize! :manage, Project
    
    @project = Project.new
    @project.customer=current_user.customer
    
  end

  def edit
    authorize! :manage, Project
    
  end

  def create
    authorize! :manage, Project
    
    @project = Project.new(project_params)
    
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    authorize! :manage, Project
    
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    authorize! :manage, Project
    
    @project.destroy
    
    respond_to do |format|
      format.html { redirect_to projects_path, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_project
      @project = Project.find(params[:id])
    end
    
    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(
        :customer_id,
        :project_type_id,
        :is_enabled,
        :name,
        :description,
        :budget,
        :objective,
        :industry_type_id,
        :life_cycle_type_id,
        :impact_type_ids => [],
        :department_type_ids => [],
        :certification_type_ids => []
        )
    end
end
