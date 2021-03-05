class Caregiver::SessionsController < Caregiver::Base 
  def new
    if current_caregiver_member
      redirect_to caregiver_root_path
    else
      @form = Caregiver::LoginForm.new
      render :new
    end
  end
  

  def create
    caregiver = Caregiver.find_by_name(params[:name])
    if caregiver 
      session[:caregiver_id] = caregiver.id
      redirect_to caregiver_root_path
    else
        render :new
    end
  end

  def destroy
    session.delete(:caregiver_id)
    redirect_to caregiver_root_path
  end

  private

  def login_params
     params.require(:caregiver_login_form).permit(:name, :password)
  end
end
