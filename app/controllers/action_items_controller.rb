class ActionItemsController < ApplicationController
  before_action :set_action_item, only: [:show, :edit, :update, :destroy]

  # GET /action_items
  # GET /action_items.json
  def index
    authorize! :show, ActionItem
    @action_items = @review.action_items
  end

  # GET /action_items/1
  # GET /action_items/1.json
  def show
    authorize! :show, ActionItem
    add_recent_item(@action_item)
  end

  # GET /action_items/new
  def new
    authorize! :manage, ActionItem
    @action_item = ActionItem.new
    @action_item.finding = Finding.find(params[:finding_id]) if params.has_key?(:finding_id) 
    
    @action_item.requested_date= DateTime.now
    @action_item.status='Not Started'
    @action_item.status_date= DateTime.now
    @action_item.user=current_user
    @action_item.requested_date=DateTime.now
    @action_item.due_date=DateTime.now + 7.days
    
  end

  # GET /action_items/1/edit
  def edit
    authorize! :manage, ActionItem
    
  end

  # POST /action_items
  # POST /action_items.json
  def create
    authorize! :manage, ActionItem
    @action_item = ActionItem.new(action_item_params)

    respond_to do |format|
      if @action_item.save
        format.html { redirect_to action_items_path, notice: 'Action item was successfully created.' }
        format.json { render :show, status: :created, location: @action_item }
      else
        format.html { render :new }
        format.json { render json: @action_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /action_items/1
  # PATCH/PUT /action_items/1.json
  def update
    authorize! :manage, ActionItem
    respond_to do |format|
      if @action_item.update(action_item_params)
        format.html { redirect_to action_items_path, notice: 'Action item was successfully updated.' }
        format.json { render :show, status: :ok, location: @action_item }
      else
        format.html { render :edit }
        format.json { render json: @action_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /action_items/1
  # DELETE /action_items/1.json
  def destroy
    authorize! :manage, ActionItem
    @action_item.destroy
    respond_to do |format|
      format.html { redirect_to action_items_path, notice: 'Action item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_action_item
      @action_item = ActionItem.find(params[:id])
      
      if @action_item.review != @review
        session.delete(:recent)
        session[:review_id] = @action_item.review.id
        redirect_to request.referrer
      end
      
    end

    # Only allow a list of trusted parameters through.
    def action_item_params
      params.require(:action_item).permit(
        :finding_id,
        :description,
        :user_id,
        :due_date,
        :comments,
        :comments_disposition,
        :status,
        :status_date,
        :requested_date,
        :completed_date
        )
    end
end
