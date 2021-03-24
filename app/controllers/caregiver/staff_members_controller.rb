class Caregiver::StaffMembersController < Caregiver::Base
  before_action :already_login?, only: [:create]
  before_action :login?, only: [:show]

  def index
    @caregivers = Caregiver.order(created_at: :desc)
    @caregivers_paginate = @caregivers.page(params[:page])
  end

  def new
    @caregiver = Caregiver.new
  end

  def create
    caregiver = Caregiver.new(caregiver_params)
    if caregiver.save!
    session[:caregiver_id] = caregiver.id 
    redirect_to caregiver_top_path(caregiver.id), notce: "登録が完了しました。"
    else
      render :new
    end
  end
 
  def show
    @caregiver = Caregiver.find(params[:id])

    if current_caregiver_member
      render :dashboard
    else
      render :show
    end

  end

  def edit
  end

  def caregiver_params
    params.require(:caregiver).permit(:name, :age, :password, :password_confirmation)
  end

end
