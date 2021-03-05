class CareRecipitent::MedicalHistoriesController < ApplicationController
  def index
   
  end

  def show
    @care_recipitent = CareRecipitent.find(params[:id])
  end
end
