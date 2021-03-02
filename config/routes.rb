Rails.application.routes.draw do

  namespace :caregiver do
    root "top#index"
    get "login" => "sessions#new", as: :login
    post "session" => "sessions#create", as: :session
    delete "session" => "sessions#destroy"
  end
 
  get "staff" => "staff/top#index"  
    resources :staff
end
