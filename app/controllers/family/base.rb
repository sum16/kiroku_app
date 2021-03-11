class Family::Base < ApplicationController
 
  def login?
    if current_family.nil? 
      redirect_to caregiver_login_path, alert: "ログインをしてください。"
    end
  end

  def already_login?
    unless current_family.nil? 
      redirect_to family_top_path(current_family.id)
    end
  end

  def current_family
    if session[:caregiver_id]
      @current_family ||= Family.find_by(id: session[:family_id])
    end
  end

helper_method :current_caregiver_member 
end
