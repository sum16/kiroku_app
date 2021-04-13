class Family::GuestSessionsController < Family::Base

  def create 
    family = Family.find_by(family_name: "ゲストユーザー様")
    guest_login(family)
   redirect_to dashboard_family_families_path, notice: "ゲストユーザーでログインしました。よろしくお願い致します！"
 end

end
