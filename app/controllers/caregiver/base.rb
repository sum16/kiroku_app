class Caregiver::Base < ApplicationController
 
  def login?
    if current_caregiver_member.nil? 
      redirect_to caregiver_login_path, alert: "ログインをしてください。"
    end
  end

  def already_login?
    unless current_caregiver_member.nil? 
      redirect_to caregiver_top_path(current_caregiver_member.id)
    end
  end

  def current_caregiver_member
    if session[:caregiver_id]
      @current_caregiver_member ||= Caregiver.find_by(id: session[:caregiver_id])
    end
  end

helper_method :current_caregiver_member 
end
