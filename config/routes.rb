Rails.application.routes.draw do
config = Rails.application.config.kiroku2


  namespace :caregiver do
    get 'admin_care_recipitent/index'
    get 'admin_care_recipitent/show'
    get 'admin_care_recipitent/new'
    get 'admin_care_recipitent/edit'
  end


  namespace :caregiver do
    root "tops#index"
    resources :tops
    get "login", to: "sessions#new", as: :login
    post "login", to: "sessions#create", as: :session
    delete "logout", to: "sessions#destroy"
  end

  
  constraints host: config[:caregiver][:host] do
    namespace :care_recipitent, path: config[:caregiver][:path] do
      root "top#index"
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
        resources :behavior_histories, only:[:index, :new, :create, :show]
      end
    end
  end
 
 
 
  get "staff" => "staff/top#index"  
    resources :staff
end
