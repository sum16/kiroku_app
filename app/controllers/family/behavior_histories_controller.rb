class Family::BehaviorHistoriesController < ApplicationController
  def index
  end

  def new
    @behavior_history = BehaviorHistory.new
  end

  def create 

  end

  def show
    @care_recipitent = CareRecipitent.find(params[:id])
    @family = Family.find(params[:id])
  end

  private

 def behavior_history_params
  params.require(:behavior_history).permit(:family_id, :care_recipitent_id, :behavior_time, :action_record, :behavior_history_date)
 end

end
