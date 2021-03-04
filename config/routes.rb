Rails.application.routes.draw do

  namespace :care_recipitent do
    get 'intake_waters/index'
    get 'intake_waters/show'
    get 'intake_waters/edit'
    get 'intake_waters/create'
    get 'intake_waters/destroy'
  end
  namespace :care_recipitent do
    root "top#index"
    resources :vitals
    resources :intake_waters
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
