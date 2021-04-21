class Caregiver::SessionsController < Caregiver::Base 
  before_action :already_login?, except: %i[ destroy ]
  
  def new 
  end

  def create 
    caregiver = Caregiver.find_by_name(params[:name])
    if caregiver && caregiver.authenticate(params[:password])
       session[:caregiver_id] = caregiver.id
       session[:last_access_time] = Time.current
       caregiver.login_records.create!(type: "logged_in")
      redirect_to dashboard_caregiver_staff_members_path, notice: "ログインしました。"
    else
      flash.now[:alert] = "名前またはパスワードが間違っています。"
      render :new
    end
  end

  def destroy
       current_caregiver_member.login_records.create!(type: "logged_out")
       session.delete(:caregiver_id)
       redirect_to caregiver_root_path, notice: "ログアウトしました。"
  end
  
  
  private

  def caregiver_params
     params.require(:caregiver_login_form).permit(:name, :password)
  end
end
