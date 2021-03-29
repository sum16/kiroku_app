Rails.application.routes.draw do

  config = Rails.application.config.kiroku2
  
  constraints host: config[:caregiver][:host] do
    namespace :caregiver do
      root "tops#index"
      resources :tops
      resources :events do
        resources :entries, only: [] do
          patch :update_all, on: :collection
        end
      end
      resources :staff_members do 
        resources :customers
      end
     
      
      get "login", to: "sessions#new", as: :login
      post "login", to: "sessions#create", as: :session
      delete "logout", to: "sessions#destroy"
    end
  end


  constraints host: config[:family][:host] do
    namespace :family, path: config[:family][:path] do
      root "families#top"
      resources  :families do
        get :main, on: :collection
        get :how_to_assist, on: :collection
      resources :tops do
      end
    end
      resources :behavior_histories, only:[:index, :new, :create, :show]
      resources :events, only: [:index, :show ]
      
    end
  end

end
