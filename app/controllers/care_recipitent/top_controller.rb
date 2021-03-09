class CareRecipitent::TopController < ApplicationController
  def index
    @care_recipitents = CareRecipitent.order(created_at: :desc)
    @caregivers_paginate = @caregivers.page(params[:page])
  end

  def new
    @caregiver = Caregiver.new
    @caregiver.care_recipitents.build
  end

  def create
    @caregiver = Caregiver.new(caregiver_params)
    binding.pry
    @caregiver.save!
    redirect_to caregiver_root_path
  end
 
  def show
  end

  def edit
  end

  def caregiver_params
    params.require(:caregiver).permit(care_recipitent_attributes: [:id, :family_name, :given_name, :family_name_kana, :given_name_kana,
      :age, :gender, :degree_of_care_required, :degree_of_support_required, :birthday, :remarks, :suspend ])
  end

end
