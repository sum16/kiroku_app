Rails.application.routes.draw do

  namespace :care_recipitent do
    root "top#index"
    resources :vitals, only:[:index, :show]
    resources :intake_waters, only:[:index, :show]
    resources :medicines, only:[:index, :show]
    resources :excretums, only:[:index, :show]
    resources :meals, only:[:index, :show]
    resources :medical_histories, only:[:index, :show]
    resources :behavior_histories, only:[:index, :show]
  end

  namespace :caregiver do
    root "top#index"
    get "login" => "sessions#new", as: :login
    post "session" => "sessions#create", as: :session
    delete "session" => "sessions#destroy"
  end

 
 
  get "staff" => "staff/top#index"  
    resources :staff
end
