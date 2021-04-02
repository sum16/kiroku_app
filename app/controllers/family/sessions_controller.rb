class Family::SessionsController < Family::Base

  def new 
    
  end

  def create 
    family = Family.find_by(params[:family_name], params[:given_name])
    if family && family.authenticate(params[:password])
      if family.remember_me? #自動ログイン
        #クッキーの有効期限を１週間に設定
        cockies.signed[:family_id] = {
        value: family.id, expires: 1.week.from_now
        }
      else
        cookies.delete(:family_id)
        session[:family_id] = family.id
      end
      redirect_to family_staff_member_path(family.id), notce: "ログインしました。"
    else
      flash.now[:alert] = "名前またはパスワードが間違っています。"
      render :new
    end
  end

  def destroy
    cookies.delete(:family_id)
    session.delete(:family_id)
    @current_family = nil
    redirect_to main_family_families_path notice: "ログアウトしました。"
  end
  
  
  private

  def family_params
     params.require(:family_login_form).permit(:name, :password)
  end


end
