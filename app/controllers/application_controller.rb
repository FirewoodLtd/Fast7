class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  impersonates :user
  before_action :authenticate_user!
  before_action :set_review

  layout :determine_layout
  
  def add_recent_item(item)
    unless item.nil?
      session[:recent] = [] if session[:recent].nil?
      new_item = [item.class.name, item.id]
      
      unless session[:recent].include? new_item 
        session[:recent] << new_item
      end
      
      session[:recent].shift if session[:recent].count > 5
    end
  end
  
  private
  
  def determine_layout
    current_user ? "application" : "notauthenticated"
  end
  
  def set_review
    begin
      @review = Review.find(session[:review_id]) unless session[:review_id].nil?
      @recent_items = session[:recent]
      current_user.customer=@review.customer
    rescue Exception => e
      puts 'Error setting review'
      session.delete(:review_id)
      session.delete(:recent)
    end
  end

  #rescue_from Exception do | exception |
   # redirect_to :back, alert: 'Application Error:' + exception.message
  #end    

 # Catch all CanCan errors and alert the user of the exception
  rescue_from CanCan::AccessDenied do | exception |
    redirect_to :back, alert: exception.message
  end

  rescue_from ActiveRecord::RecordNotUnique do | exception |
    redirect_to :back, alert: 'Item already exists'
  end         

  rescue_from ActiveRecord::InvalidForeignKey do | exception |
    redirect_to :back, alert: 'Dependent data exists, unable to delete'
  end         


end
