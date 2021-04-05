class Family::FamiliesController < Family::Base
  before_action :set_q, only: [:dashboard, :search]
#家族登録用のコントローラー 
  before_action :already_login?, only: [:create]
  before_action :login?, only: [:show]


  def main
   if current_family.present?
      redirect_to family_families_path 
   else
     render :main
   end
  end

  def index
  
  end

  def dashboard
  
  end


  def new
    @family = Family.new
  end

  def create
     @family = Family.new(family_params)  
    if @family.save
       session[:family_id] = @family.id
       redirect_to family_families_path(params[:family_id], params[:id]), notice: "登録が完了しました。"
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

  def search
    @results = @q.result
    @excretas_results = @excreta.result
    @meals_results = @meal.result
    @intake_waters_results = @intake_water.result
    @bathing_days_results = @bathing_day.result
    @medicines_results = @medicine.result
    @behavior_histories_results = @behavior_history.result
  end


  private
  def family_params
    params.require(:family).permit(:care_recipitent_name, :family_name, :given_name, :family_name_kana, :given_name_kana, :relationship, :address, :gender, :password, :password_confirmation )
  end

  def set_q
    @q = Vital.ransack(params[:q])
    @excreta = Excreta.ransack(params[:q])
    @meal = Meal.ransack(params[:q])
    @intake_water = IntakeWater.ransack(params[:q])
    @bathing_day = BathingDay.ransack(params[:q])
    @medicine = Medicine.ransack(params[:q])
    @behavior_history = BehaviorHistory.ransack(params[:q])
  end
  
end

