Rails.application.routes.draw do
  
  config = Rails.application.config.kiroku2
  
  constraints host: config[:caregiver][:host] do
    namespace :caregiver do
      root "staff_members#index"
      resources :tops
      resources :customer_informations
      resources :events do
        resources :entries, only: [] do
          patch :update_all, on: :collection
        end
      end
      resources :staff_members do 
        resources :login_records, only: [ :index ]
        resources :customers   
        get :dashboard, on: :collection
      end 
      resources :posts do
        resource :share_buttons, only: [ :create, :destroy ]
      end
      get "login", to: "sessions#new", as: :login
      post "login", to: "sessions#create", as: :session
      delete "logout", to: "sessions#destroy"
      get "messages/count", to:"ajax#message_count"
      resources :messages, only: [ :index, :show, :destroy ] do
        get :inbound, :outbound, :deleted, on: :collection
        resource :reply, only: [ :new, :create ] do
          post :confirm
        end
      end
    end
  end


  constraints host: config[:family][:host] do
    namespace :family, path: config[:family][:path] do
  
      get "login", to: "sessions#new", as: :login
      post "login", to: "sessions#create", as: :session
      delete "logout", to: "sessions#destroy"
      get 'youtubes/index', to: "youtubes#index"
      root "families#main"
      resource :account, expect: [ :new, :create, :destroy ] do
        patch :confirm
      end
      resources :tops 
      resources  :families do
        get :main, on: :collection
        get :dashboard, on: :collection
        get :search, on: :collection  
      end
      resources :behavior_histories, only:[:index, :new, :create, :show]
      resources :events, only: [:index, :show ] do
        resource :entry, only: [ :create ] do
          patch :cancel
        end
      end
      resources :messages, exept: [ :edit, :update ] do
        post :confirm, on: :collection
        resource :reply, only: [ :new, :create ] do
          post :confirm
        end
      end
    end
  end

end
