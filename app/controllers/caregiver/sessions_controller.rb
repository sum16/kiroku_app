class Caregiver::SessionsController < Caregiver::Base 
  def new
    if current_caregiver_member
      redirect_to caregiver_root_path
    else
      @form = Caregiver::LoginForm.new
      render :new
    end
  end
end
