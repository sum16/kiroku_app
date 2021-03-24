class Family::TopsController < ApplicationController
#一括フォーム用のコントローラー
  def main 
    @family = Family.find(1)
  end

  def index
     
  end

  def show
    @care_recipitent = CareRecipitent.find(params[:id])
  end

  def new
    @family = Family.new
    @family.vitals.build
    @family.bathing_days.build
    @family.intake_waters.build
    @family.medicines.build
    @family.excretas.build
    @family.meals.build
    @family.behavior_histories.build
  end

  def create 
    if @family = Family.create!(family_params)
       redirect_to family_family_tops_path
    else
       render :new
    end
  end


  private 

  def family_params
params.require(:family).permit(:family_name, :given_name,:family_name_kana, :given_name_kana, :address, :gender, :relationship, vitals_attributes: [:measuring_date, :temperature, :hign_blood_pressure, :low_blood_pressure, :breathing, :spo2, :pulse, :family_id], bathing_days_attributes: [:bathing_date, :judge_bath, :family_id], intake_waters_attributes: [:drink_date, :amount_of_water, :family_id], medicines_attributes: [:check_before_breakfast, :check_after_breakfast, :check_before_lunch, :check_after_lunch, :check_before_dinner, :check_after_dinner, :check_ointment, :check_eye_drops, :family_id], excretas_attributes: [:excreta_date, :judge_shit, :judge_pee, :family_id], meals_attributes: [:meal_date, :breakfast, :lunch, :snack, :dinner, :family_id], behavior_histories_attributes: [:behavior_history_date, :behavior_time, :action_record, :family_id])
  end
end
