class CareRecipitent::IntakeWatersController < ApplicationController
  def index
  end

  def show
    @care_recipitent = CareRecipitent.find(params[:id])
  end

  def edit
  end

  def create
  end

  def destroy
  end
end
