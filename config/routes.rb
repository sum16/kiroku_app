Rails.application.routes.draw do

  config = Rails.application.config.kiroku2
  
  constraints host: config[:caregiver][:host] do
    namespace :caregiver do
      root "tops#index"
      resources :staff_members do 
        resources :tops
      end
      
      get "login", to: "sessions#new", as: :login
      post "login", to: "sessions#create", as: :session
      delete "logout", to: "sessions#destroy"
      get 'admin_care_recipitent/index'
      get 'admin_care_recipitent/show'
      get 'admin_care_recipitent/new'
      get 'admin_care_recipitent/edit'
    end
  end
    
  
    
    constraints host: config[:caregiver][:host] do
      namespace :care_recipitent, path: config[:caregiver][:path] do
        root "top#index"
       
        resources :tops
        resources :vitals, only:[:index, :show]
        resources :intake_waters, only:[:index, :show]
        resources :medicines, only:[:index, :show]
        resources :excretums, only:[:index, :show]
        resources :meals, only:[:index, :show]
        resources :medical_histories, only:[:index, :show] 
      end
    end
  
  
    constraints host: config[:family][:host] do
      namespace :family, path: config[:family][:path] do
        root "families#top"
        resources  :families, only:[:show, :new, :create, :edit, :destroy] do
          get :main, on: :collection
        
        resources :tops do
        end
      end
          resources :behavior_histories, only:[:index, :new, :create, :show]
        
      end
    end
   
   
   
    get "staff" => "staff/top#index"  
      resources :staff
  end
