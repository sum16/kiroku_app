class Caregiver::GuestSessionsController < Caregiver::Base

  def create 
    caregiver = Caregiver.find_by(name: "test")
        guest_login(caregiver)
        session[:last_access_time] = Time.current
        caregiver.login_records.create!(type: "logged_in")
        redirect_to dashboard_caregiver_staff_members_path, notice: "ゲストユーザーでログインしました。よろしくお願い致します！"
    end

end
