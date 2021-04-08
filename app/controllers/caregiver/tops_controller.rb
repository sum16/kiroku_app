class Caregiver::TopsController  < Caregiver::Base

  def index
    #@caregiver = Caregiver.find(params[:staff_member_id])
    @care_recipitents = CareRecipitent.includes(:caregiver)
  end

  def new
    @care_recipitent = CareRecipitent.new
  end

  def create
    @care_recipitent = current_caregiver_member.care_recipitents.new(care_recipitent_params)
    if @care_recipitent.save
     redirect_to caregiver_top_path(@care_recipitent.id), notice: "利用者情報を登録しました"
   else
    flash.now.alert = "入力に誤りがあります。"
    render :new
   end
  end

  def show
    @care_recipitent = CareRecipitent.find(params[:id])
  end

  def edit 
    @care_recipitent = CareRecipitent.find(params[:id])
  end

  def update 
      @care_recipitent = CareRecipitent.find(params[:id])
   if @care_recipitent.update(care_recipitent_params)
      redirect_to caregiver_top_path(@care_recipitent.id), notice: "利用者情報を更新しました"
   else
      flash.now.alert = "入力に誤りがあります。"
      render :new
   end
  end

  def destroy
    @care_recipitent = CareRecipitent.find(params[:id])
    @care_recipitent.destroy
    redirect_to caregiver_tops_path, notice: "利用者情報を削除しました"
  end

  private

  def care_recipitent_params
    params.require(:care_recipitent).permit(:family_name, :given_name, :family_name_kana, :given_name_kana, :age, :gender, :birthday,
      :degree_of_care_required, :degree_of_support_required, :remarks, :suspend, :current_disease, :past_disease)
  end

end
