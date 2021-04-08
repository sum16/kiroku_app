class Family::TopsController < Family::Base
#一括フォーム用のコントローラー
  def main 
    @family = Family.find(1)
  end

  def index
    @family = Family.find_by(id: current_family.id)
  end

  def show
    @care_recipitent = CareRecipitent.find(params[:id])
  end

  def new
    @family = Family.new
    @vital = @family.vitals.new
    @bathing_day = @family.bathing_days.new
    @intake_water = @family.intake_waters.new
    @medicine = @family.medicines.new
    @excreta = @family.excretas.new
    @meal = @family.meals.new
    @behavior_history = @family.behavior_histories.new
    
  end

  def create 
    if @family = current_family.vitals.create(family_params[:vitals_attributes]["0"])
      @family = current_family.bathing_days.create(family_params[:bathing_days_attributes]["0"])
      @family = current_family.intake_waters.create(family_params[:intake_waters_attributes]["0"])
      @family = current_family.medicines.create(family_params[:medicines_attributes]["0"])
      @family = current_family.excretas.create(family_params[:excretas_attributes]["0"])
      @family = current_family.meals.create(family_params[:meals_attributes]["0"])
      @family = current_family.behavior_histories.create(family_params[:behavior_histories_attributes]["0"])
       redirect_to family_tops_path, notice: "記録を登録しました"
    else
      flash.now.alert = "入力に誤りがあります。"
       render :new
    end
  end


  private 
  
def family_params
params.require(:family).permit(vitals_attributes:[:measuring_date, :temperature, :hign_blood_pressure, :low_blood_pressure, :breathing, :spo2, :pulse], bathing_days_attributes:[:bathing_date, :judge_bath], intake_waters_attributes:[:drink_date, :amount_of_water], medicines_attributes:[:medicine_date, :check_before_breakfast, :check_after_breakfast, :check_before_lunch, :check_after_lunch, :check_before_dinner, :check_after_dinner, :check_ointment, :check_eye_drops], excretas_attributes:[:excreta_date, :judge_shit, :judge_pee], meals_attributes:[:meal_date, :breakfast, :lunch, :snack, :dinner], behavior_histories_attributes:[:behavior_history_date, :behavior_time, :action_record])
  end
end
