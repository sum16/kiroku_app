class Caregiver::StaffMembersController < Caregiver::Base
  before_action :already_login?, only: %i[ new create ]
  before_action :login?, only: %i[ index show edit ]
  before_action :set_caregiver, only: %i[ show edit ]

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
    redirect_to caregiver_staff_members_path, notice: "登録が完了しました。"
    else
      flash.now.alert = "入力に誤りがあります。"
      render :new
    end
  end

  def dashboard
  end
 
  def show
  end

  def edit
  end

  def update 
    caregiver = Caregiver.find(params[:id])
    if caregiver.update(caregiver_params)
       redirect_to caregiver_staff_member_path(current_caregiver_member), notice: "アカウント情報を変更しました。"
    else 
       flash.now.alert = "入力に誤りがあります。"
       render :new
    end
  end

  def destroy
    caregiver = Caregiver.find(params[:id])
    if caregiver.destroy
       redirect_to caregiver_staff_members_path, notice: "アカウント情報を削除しました。"
    end
  end

  private

  def caregiver_params
    params.require(:caregiver).permit(:name, :age, :password, :password_confirmation)
  end

  def set_caregiver
    @caregiver = Caregiver.find(params[:id])
  end

end
