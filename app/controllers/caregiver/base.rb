class Caregiver::Base < ApplicationController
 
  def login?
    if current_caregiver_member.nil? 
       redirect_to caregiver_login_path, alert: "ログインをしてください。"
    end
  end

  def already_login?
    unless current_caregiver_member.nil? 
      redirect_to dashboard_caregiver_staff_members_path, notice: "すでにログインしています"
    end
  end

  def current_caregiver_member
    #if session[:caregiver_id]
     # @current_caregiver_member ||= Caregiver.find_by(id: session[:caregiver_id])
    #end
    if caregiver_id = cookies.signed[:caregiver_id] || session[:caregiver_id]
      @current_caregiver_member ||= Caregiver.find_by(id: caregiver_id)
    end
  end

  #ゲストユーザー様ログイン
  def guest_login(caregiver)
    session[:caregiver_id] = caregiver.id
  end
  
helper_method :current_caregiver_member 
end
