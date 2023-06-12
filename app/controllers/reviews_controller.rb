class ReviewsController < ApplicationController
  before_action :set_current_review, only: [:show, :edit, :update, :destroy, :download_report]
  
  # GET /reviews
  # GET /reviews.json
  def index
    authorize! :show, Review
    
    @projects = current_user.customer.projects.order(:created_at).limit(current_user.customer.max_projects)
    @reviews = current_user.customer.reviews.where(:project_id => @projects.pluck(:id)).order(:created_at).limit(current_user.customer.max_reviews)
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    authorize! :show, Review
    
    if @review.measures.count >0
    @guidance= CategoryScoreRange.find_by(category_id: @review.measures.first.category.root.id, score_range_id: @review.get_score_range.id) unless @review.get_score_range.nil?
    end
    
    respond_to do |format|
      format.html
      format.json {
        #JS Report request format
        request_body= {
          "template" => { "name" => "review-report" },
          "data" => JSON.parse(@review.to_json(include:
            [
              :customer,
              :project,
              { :engagement => { :include => :lead_firewood_user}},
              { :interviews => { :include => :occupation_type}},
              { :documents => { :include => :document_type}},
              { :findings => { :include => :measure}},
              { :review_categories => {:include => :category}},
              { :review_sub_categories => {:include => :sub_category}}
            ])),
          #"data" => JSON.parse(@review.to_json(include: [:customer, :project, :engagement, :findings, :interviews, :documents, :review_categories, :review_sub_categories])),
          "options" => { "reports" => { "save" => true } }
          }  
          
          render :json => request_body.to_json
      }
      format.pdf { 
        
        url = "http://18.133.87.232:5488/api/report" #move this to an ENV
        
        uri = URI(url)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = false
        
        request = Net::HTTP::Post.new(uri.path, {'Content-Type' => 'application/json'})
        
        #JS Report request format
        request_body= {
          "template" => { "name" => "review-report" },
          "data" => JSON.parse(@review.to_json(include:
            [
              :customer,
              :project,
              { :engagement => { :include => :lead_firewood_user}},
              { :interviews => { :include => :occupation_type}},
              { :documents => { :include => :document_type}},
              { :findings => { :include => :measure}},
              { :review_categories => {:include => :category}},
              { :review_sub_categories => {:include => :sub_category}}
            ])),
          #"data" => JSON.parse(@review.to_json(include: [:customer, :project, :engagement, :findings, :interviews, :documents, :review_categories, :review_sub_categories])),
          "options" => { "reports" => { "save" => true } }
          }  
        
        request.body = request_body.to_json
        
        response = http.request(request)
        
        send_data(response.body, filename: 'pdf_test.pdf', type: 'application/pdf', disposition: 'attachment')  
      }
    end
  end
  
  # GET /reviews/new
  def new
    authorize! :manage, Review
    
    @review = Review.new
    @review.project = Project.find(params[:project_id]) if params.has_key?(:project_id) 
    @templates = current_user.customer.templates.order(:name)
  end

  # GET /reviews/1/edit
  def edit
    authorize! :manage, Review
    
    
  end

  # POST /reviews
  # POST /reviews.json
  def create
    authorize! :manage, Review
    
    @review = Review.new(review_params)
    @review.save!
    
    #cycle through catagories to add measaures
    params[:review][:templates].each do |template_id|
      unless template_id.length == 0
        template = Template.find(template_id)
        template.measures.each do |m|
          #add measures to review
          rm = ReviewMeasure.new
          rm.review = @review
          rm.measure = m
          rm.user = current_user
          rm.save!              
        end
      end
    end
    
    
    #cyle through docuement types to create documents
    params[:review][:document_types].each do |document_type_id|
      unless document_type_id.length == 0
        document_type= DocumentType.find(document_type_id)
        doc= Document.new
        doc.review=@review
        doc.document_type=document_type
        doc.save!
      end
    end
    
    #cylce through interview occupations
    params[:review][:occupation_types].each do |occupation_type_id|
      unless occupation_type_id.length == 0
        occupation_type= OccupationType.find(occupation_type_id)
        interview= Interview.new
        interview.review=@review
        interview.user =current_user
        interview.occupation_type=occupation_type
        interview.save!
      end      
    end

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    authorize! :manage, Review
    
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    authorize! :manage, Review
    
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_path, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def download_report
    
  end

  private
    
  def set_current_review
    
      @review = Review.find(params[:id])
      
      session.delete(:recent) if session[:review_id] != @review.id 
      session[:review_id] = @review.id
      
      @templates = current_user.customer.templates.order(:name)
      current_user.update_attribute(:customer, @review.customer)
    
  end

  # Only allow a list of trusted parameters through.
  def review_params
      params.require(:review).permit(
      :project_id,
      :score_id,
      :summary,
      :context,
      :scope,
      :enquiry,
      :is_enabled,
      :start_date,
      :stop_date,
      :reference_cd,
      :lead_firewood_user_id,
      :lead_customer_user_id,
      :templates,
      :document_types,
      :occupation_types,
      :notes
      )
  end
end
