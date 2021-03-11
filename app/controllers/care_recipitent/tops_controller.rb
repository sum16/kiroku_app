class CareRecipitent::TopsController < ApplicationController
before_action :current_caregiver_member

  def index
    @care_recipitents = CareRecipitent.order(created_at: :desc)
    @caregivers_paginate = @caregivers.page(params[:page])
  end

  def new
    @care_recipitent = CareRecipitent.new
  end

  def create
    @care_recipitent  = CareRecipitent.new(care_recipitent_params)
    @care_recipitent.build_family #子のfamilyモデルを含んで作成
    @care_recipitent.save!
    redirect_to care_recipitent_top_path
  end
 
  def show
    @care_recipitent = CareRecipitent.find(params[:id])
  end

  def edit
  end

  private


  def current_caregiver_member
    if session[:caregiver_id]
      current_caregiver_member ||= Caregiver.find_by(id: session[:caregiver_id])
    end
  end

  def care_recipitent_params
    params.permit(:family_name, :given_name, :family_name_kana, :given_name_kana,
      :age, :gender, :degree_of_care_required, :degree_of_support_required, :birthday, :remarks, :suspend, :caregiver_id)
  end


end
