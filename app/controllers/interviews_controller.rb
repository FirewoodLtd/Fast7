class InterviewsController < ApplicationController
  before_action :set_interview, only: [:show, :edit, :update, :destroy]

  # GET /interviews
  # GET /interviews.json
  def index
    authorize! :show, Interview
    
    @interviews = @review.interviews
  end

  # GET /interviews/1
  # GET /interviews/1.json
  def show
    authorize! :show, Interview
    
    add_recent_item(@interview)
  end

  # GET /interviews/new
  def new
    authorize! :manage, Interview
    
    @interview = Interview.new
    @interview.review = @review
  end

  # GET /interviews/1/edit
  def edit
    authorize! :manage, Interview
    
  end

  # POST /interviews
  # POST /interviews.json
  def create
    authorize! :manage, Interview
    
    @interview = Interview.new(interview_params)

    respond_to do |format|
      if @interview.save
        format.html { redirect_to interviews_path, notice: 'Interview was successfully created.' }
        format.json { render :show, status: :created, location: @interview }
      else
        format.html { render :new }
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interviews/1
  # PATCH/PUT /interviews/1.json
  def update
    authorize! :manage, Interview
    
    respond_to do |format|
      if @interview.update(interview_params)
        format.html { redirect_to interviews_path, notice: 'Interview was successfully updated.' }
        format.json { render :show, status: :ok, location: @interview }
      else
        format.html { render :edit }
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interviews/1
  # DELETE /interviews/1.json
  def destroy
    authorize! :manage, Interview
    
    @interview.destroy
    respond_to do |format|
      format.html { redirect_to interviews_path, notice: 'Interview was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interview
      @interview = Interview.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def interview_params
      params.require(:interview).permit(
        :review_id,
        :occupation_type_id,
        :user_id,
        :interview_date,
        :is_enabled,
        :notes,
        :participants
        )
    end
end
