class Caregiver::SessionsController < Caregiver::Base 
  #before_action :already_login?, except: [:destroy]
  protect_from_forgery :except => [:destroy]
  
  def new 
    
  end

  def create 
    caregiver = Caregiver.find_by_name(params[:name])
    if caregiver && caregiver.authenticate(params[:password])
      if caregiver.remember_me?
        #クッキーの有効期限を１週間に設定
        cockies.signed[:caregiver_id] = {
        value: caregiver.id, expires: 1.week.from_now
        }
      else
        cookies.delete(:caregiver_id)
        session[:caregiver_id] = caregiver.id
      end
      redirect_to caregiver_staff_member_path(caregiver.id), notce: "ログインしました。"
    else
      flash.now[:alert] = "名前またはパスワードが間違っています。"
      render :new
    end
  end

  def destroy
    forget(current_caregiver_member)
    cookies.delete(:caregiver_id)
    session.delete(:caregiver_id)
    @current_caregiver_member = nil
    redirect_to caregiver_staff_members_path, notice: "ログアウトしました。"
  end
  
  
  private

  def caregiver_params
     params.require(:caregiver_login_form).permit(:name, :password)
  end
end
