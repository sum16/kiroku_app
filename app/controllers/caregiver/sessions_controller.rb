class Caregiver::SessionsController < Caregiver::Base 
  before_action :already_login?, except: :destroy
  protect_from_forgery :except => [:destroy]
  
  def new 
    
  end

  def create 
    caregiver = Caregiver.find_by_name(params[:name])
    if caregiver && caregiver.authenticate(params[:password])
      session[:caregiver_id] = caregiver.id
      redirect_to caregiver_staff_member_path(caregiver.id), notce: "ログインしました。"
    else
      flash.now[:alert] = "名前またはパスワードが間違っています。"
      render :new
    end
  end

  def destroy
    session[:caregiver_id] = nil
    redirect_to caregiver_staff_members_path, notice: "ログアウトしました。"
  end
  
  
  private

  def caregiver_params
     params.require(:caregiver_login_form).permit(:name, :password)
  end
end
