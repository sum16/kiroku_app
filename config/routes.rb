Rails.application.routes.draw do
  config = Rails.application.config.kiroku2

  constraints host: config[:caregiver][:host] do
    namespace :care_recipitent, path: config[:caregiver][:path] do
      root "top#index"
      resources :vitals, only:[:index, :show]
      resources :intake_waters, only:[:index, :show]
      resources :medicines, only:[:index, :show]
      resources :excretums, only:[:index, :show]
      resources :meals, only:[:index, :show]
      resources :medical_histories, only:[:index, :show]
      resources :behavior_histories, only:[:index, :show]
    end
  end


  namespace :caregiver do
    root "top#index"
    get "login" => "sessions#new", as: :login
    post "session" => "sessions#create", as: :session
    delete "session" => "sessions#destroy"
  end

  constraints host: config[:family][:host] do
    namespace :family, path: config[:family][:path] do
      root "families#top"
      resources  :families, only:[:show, :new, :create, :edit, :destroy]
    end
  end
 
 
 
  get "staff" => "staff/top#index"  
    resources :staff
end
