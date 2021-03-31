class Family::FamiliesController < Family::Base
#家族登録用のコントローラー 
  before_action :already_login?, only: [:create]
  before_action :login?, only: [:show]

  def index
   # render "youtubes/index"
  end


  def new
    @family = Family.new
  end

  def create
    @family = Family.new(family_params)  
   if @family.save!
    session[:family_id] = @family.id
    redirect_to family_families_path(params[:family_id], params[:id]), notice: "登録が完了しました。"
   # redirect_to caregiver_staff_member_tops_path(params[:staff_member_id], @care_recipitent.id)
   else
    flash.now.alert = "入力に誤りがあります。"
    render :new
   end
  end

  def show
    @family = Family.find(params[:id])
  end


  def edit
  end



  private
  def family_params
    params.require(:family).permit(:care_recipitent_name, :family_name, :given_name, :family_name_kana, :given_name_kana, :relationship, :address, :gender, :password, :password_confirmation )
  end
end

