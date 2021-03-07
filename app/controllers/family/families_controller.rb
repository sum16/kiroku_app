class Family::FamiliesController < ApplicationController

  def top 

  end
  
  def index
  end

  def show
    @care_recipitent = CareRecipitent.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def destroy
  end
end
