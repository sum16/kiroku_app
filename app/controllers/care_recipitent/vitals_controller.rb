class CareRecipitent::VitalsController < ApplicationController
  def index
    @vitals = Vital.order(created_at: :desc)
  end

  def show
    @care_recipitent = CareRecipitent.find(params[:id])
  
    
  end
end
