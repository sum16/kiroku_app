class Caregiver::Base < ApplicationController
 
  def login?
    if current_caregiver_member.nil? 
       redirect_to caregiver_login_path, alert: "ログインをしてください。"
    end
  end

  def already_login?
    unless current_caregiver_member.nil? 
      redirect_to caregiver_staff_member_path(current_caregiver_member.id), notice: "すでにログインしています"
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

  #ゲストユーザーログイン
  def guest_login(family)
    session[:family_id] = family.id
  end
  
helper_method :current_caregiver_member 
end
