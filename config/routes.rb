Rails.application.routes.draw do

  namespace :care_recipitent do
    root "top#index"
    resources :vitals
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
