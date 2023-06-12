class ObservationLinksController < ApplicationController
   before_action :set_observation, only: [:show, :edit, :update, :destroy]

    def index
       authorize! :show, ObservationLink
       
       @observation_links = @review.observation_links.all.order(created_at: :desc)
    end


   def new
      authorize! :show, ObservationLink
      
      @observation_link= ObservationLink.new
   end
   
   def show
      authorize! :show, ObservationLink
      
   end
   
   def edit
      authorize! :manage, ObservationLink
      
   end
   
   def update
      authorize! :manage, ObservationLink
      
      @observation_link.update(observation_params)
      redirect_to @observation_link.observation, notice: 'Observation link updated'
      
   end
    
   def create
      authorize! :manage, ObservationLink
      
      @observation_link= ObservationLink.new(observation_params)
      @observation_link.save
      
      if params.has_key?(:interview_id)
         redirect_to @observation_link.interview, notice: 'Observation linked' and return
      elsif params.has_key?(:document_id)
         redirect_to @observation_link.document, notice: 'Observation linked' and return
      elsif params.has_key?(:review_measure_id)
         redirect_to @observation_link.review_measure, notice: 'Observation linked' and return
      else
         redirect_to @observation_link.observation, notice: 'Observation link created'   
      end      
      
   end
   
   def destroy
      authorize! :manage, ObservationLink
      
      @observation_link.destroy
      redirect_to @observation_link.observation, notice: 'Observation link removed'
   end  

   private
  
   def set_observation
      @observation_link = ObservationLink.find(params[:id])
   end  
  
   def observation_params
    params.permit(
       :observation_id,
       :document_id,
       :interview_id,
       :review_measure_id
      )
   end
        
end
