class CareRecipitent::BehaviorHistoriesController < ApplicationController
  def index
  end

  def show
    @care_recipitent = CareRecipitent.find(params[:id])
  end
end
