class Caregiver::TopsController  < Caregiver::Base

  def index

  end

  def new
    @care_recipitent = CareRecipitent.new
  end

  def show
    @caregiver = Caregiver.find(params[:staff_member_id])
    @care_recipitents = @caregiver.care_recipitents
  end

  def create
    @care_recipitent = CareRecipitent.new(care_recipitent_params)  
    @care_recipitent.caregiver_id = session[:caregiver_id]
    @care_recipitent.save
    redirect_to caregiver_staff_member_top_path(params[:staff_member_id], @care_recipitent.id)
  end

  private

  def care_recipitent_params
    params.permit(:family_name, :given_name, :family_name_kana, :given_name_kana, :age, :gender,
      :degree_of_care_required, :degree_of_support_required, :remarks, :suspend)
  end

end
