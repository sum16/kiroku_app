class Family::FamiliesController < Family::Base

  def top 
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

  end

  def create 
    @family = Family.new
    @care_recipitent = CareRecipitent.find(params[:id])
    @family.id = @care_recipitent.family.id
    @behavior_history = @family.behavior_histories.build(behavior_history_params)
    @behavior_history.save!
    redirect_to family_family_behavior_histories_path
  end

  def edit
  end

  def destroy
  end

  private

  def behavior_history_params
    params.require(:behavior_history).permit(:family_id, :behavior_time, :action_record, :behavior_history_date)
   end

  
end



