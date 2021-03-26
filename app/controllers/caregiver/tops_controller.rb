class Caregiver::TopsController  < Caregiver::Base
  protect_from_forgery :except => [:destroy]

  def index
    #@caregiver = Caregiver.find(params[:staff_member_id])
    @care_recipitents = CareRecipitent.includes(:caregiver)
  end

  def new
    @care_recipitent = CareRecipitent.new
  end

  def create
    @care_recipitent = CareRecipitent.new(care_recipitent_params)  
    @care_recipitent.caregiver_id = session[:caregiver_id]
   if @care_recipitent.save
    redirect_to caregiver_top_path(@care_recipitent.id)
    #caregiver_staff_member_tops_path(params[:staff_member_id], @care_recipitent.id)
   else
    render :new
   end
  end

  def show
    @care_recipitent = CareRecipitent.find(params[:id])
  end

  def destroy
    @care_recipitent = CareRecipitent.find(params[:id])
    @care_recipitent.destroy
    redirect_to caregiver_tops_path
  end

  private

  def care_recipitent_params
    params.require(:care_recipitent).permit(:family_name, :given_name, :family_name_kana, :given_name_kana, :age, :gender, :birthday,
      :degree_of_care_required, :degree_of_support_required, :remarks, :suspend)
  end

end
