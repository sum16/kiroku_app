class Family::Base < ApplicationController
 
  def current_family
    if family_id = cookies.signed[:family_id] || session[:family_id]
      @current_family ||= Family.find_by(id: family_id)
    end
  end

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

 

helper_method :current_family
end
