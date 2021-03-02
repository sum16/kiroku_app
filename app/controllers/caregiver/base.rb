class Caregiver::Base < ApplicationController

private def current_caregiver_member
  if session[:caregiver_id]
    @current_caregiver_member ||=
    Caregiver.find_by(id: session[:caregiver_id])
  end
end

helper_method :current_caregiver_member 
end
