Rails.application.routes.draw do
  
  devise_for :users
  resources :users do
    member do
      post :impersonate
      post :send_welcome_email
      get :notebook
    end    
    collection do
      post :stop_impersonating  
    end
  end
  
  get 'home/index'
  root to: 'home#index'
  
  resources :measure_document_types
  resources :action_items
  resources :review_evidences
  resources :documents
  resources :interviews
  resources :findings
  resources :scores
  resources :review_measures
  resources :template_measures
  resources :evidences
  resources :categories
  resources :measures
  resources :templates
  resources :projects
  resources :roles
  resources :category_score_ranges
  resources :observations
  resources :observation_links
  
  resources :reviews do
    member do
     #get :show_category
     get :download_report
    end
  end  
  
  resources :customers do
    member do
      put :join
    end
  end
  
  #dependent selects
  get 'get_guidance_by_score', to: 'review_measures#get_guidance', :format => :json
  
end
