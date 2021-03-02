Rails.application.routes.draw do

  get 'caregivers' => "caregiver/top#index"
  get 'caregivers/show'
  get 'caregivers/new'
  get 'caregivers/create'
  get 'caregivers/edit'
  get "staff" => "staff/top#index"  
    resources :staff
end
