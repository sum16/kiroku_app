Rails.application.routes.draw do

  get "staff" => "staff/top#index"  
    resources :staff
end
