class ObservationsController < ApplicationController
   before_action :set_observation, only: [:show, :edit, :update, :destroy]


   def index
      authorize! :show, Observation
      
      @observations = @review.observations.all.order(created_at: :desc)
   end

   def show
      authorize! :show, Observation
      
      add_recent_item(@observation)
   end
   
   def edit
      authorize! :manage, Observation
      
      
   end
   
   
   def new
      authorize! :manage, Observation
      
      @observation= Observation.new
      @observation.user = current_user
      @observation.review = @review
      
      @interview= Interview.find(params[:interview_id]) if params.has_key?(:interview_id)
      @document= Document.find(params[:document_id]) if params.has_key?(:document_id)
      @review_measure= ReviewMeasure.find(params[:review_measure_id]) if params.has_key?(:review_measure_id)
      
   end
   
   
   def update
      authorize! :manage, Observation
      
      begin
         @observation.update(observation_params)
         
         #??set all the observation links to docs, interview, etc
         
         redirect_to @observation, notice: 'Observation updated'
      rescue ActiveRecord::RecordNotUnique => e
         redirect_to @observation, alert: 'Observation already exisits'
      rescue Exception => e
         redirect_to @observation, alert: e.message
      end
   end
    
   def create
      authorize! :manage, Observation
      
      observation= Observation.new(observation_params)
    
      begin
         observation.save
         
         #link observation to resources if provided
         if params.has_key?(:observation_links)
            @observation_link= ObservationLink.new
            @observation_link.observation=observation
            
            if params[:observation_links].has_key?(:interview_id)
               @interview=Interview.find(params[:observation_links][:interview_id])
               @observation_link.interview=@interview
               @observation_link.save            
               redirect_to @interview, notice: 'Observation created and linked' and return
            elsif params[:observation_links].has_key?(:document_id)
               @document=Document.find(params[:observation_links][:document_id])
               @observation_link.document=@document
               @observation_link.save            
               redirect_to @document, notice: 'Observation created and linked' and return
            elsif params[:observation_links].has_key?(:review_measure_id)
               @review_measure=ReviewMeasure.find(params[:observation_links][:review_measure_id])
               @observation_link.review_measure=@review_measure
               @observation_link.save            
               redirect_to @review_measure, notice: 'Observation created and linked' and return
            end
            
         end
         
         redirect_to observation, notice: 'Observation created'
      rescue ActiveRecord::RecordNotUnique => e
         redirect_to observation, alert: 'Observation already exists'
      rescue Exception => e
         redirect_to observation, alert: e.message
      end
   end
   
   def destroy
      authorize! :manage, Observation
      
      @observation.destroy
      redirect_to observations_path, notice: 'Observation removed'
   end  

   private
  
   def set_observation
      @observation = Observation.find(params[:id])
   end  
  
   def observation_params
    params.require(:observation).permit(
       :user_id,
       :comments,
       :disposition,
       :review_id
      )
   end
    
end
