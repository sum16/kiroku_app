class Family::FamiliesController < Family::Base
#家族登録用のコントローラー

  def index
  end

  def new
    @family = Family.new
  end

  def create
    @family = Family.new(family_params)  
    session[:family_id] = @family.id 
    @family.care_recipitent_id = 1
   if @family.save!
    redirect_to family_family_path(params[:family_id], params[:id])
   # redirect_to caregiver_staff_member_tops_path(params[:staff_member_id], @care_recipitent.id)
   else
    render :new
   end
  end

  def show
    @family = Family.find(params[:id])
  end


  def edit
  end

  def destroy
  end

  private
  def family_params
    params.require(:family).permit(:family_name, :given_name, :family_name_kana, :given_name_kana, :relationship, :address, :gender, :care_recipitent_id )
  end
end

