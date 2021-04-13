class Family::SessionsController < Family::Base
  before_action :already_login?, except: %i[ destroy ]
  
  def new 
  end

  def create 
    family = Family.find_by(given_name: params[:given_name])
    if family && family.authenticate(params[:password])
       session[:family_id] = family.id
       redirect_to family_families_path, notice: "ログインしました。"
    else
       flash.now[:alert] = "名前またはパスワードが間違っています。"
       render :new
    end
  end

  def destroy
    current_family = nil
    session.delete(:family_id)
    redirect_to main_family_families_path, notice: "ログアウトしました。"
  end
  
  private

  def family_params
     params.require(:family_login_form).permit(:name, :password)
  end

end
