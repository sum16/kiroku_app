require "csv"

class Caregiver::StaffMembersController < Caregiver::Base
  before_action :already_login?, only: %i[ new create main ]
  before_action :login?, only: %i[ index show edit ]
  before_action :set_caregiver, only: %i[ show edit ]

  def main

  end
  
  def index
    @caregivers = Caregiver.order(created_at: :desc)
    @caregivers_paginate = @caregivers.page(params[:page])
  end

  def new
    @caregiver = Caregiver.new
  end

  def create
    @caregiver = Caregiver.new(caregiver_params)
    if @caregiver.save
    session[:caregiver_id] = @caregiver.id 
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
    if caregiver.deletable?
       caregiver.destroy!
       flash.notice = "スタッフを削除しました。"
    else
      flash.alert = "イベントを運営中のため削除できません。"
    end
    redirect_to caregiver_staff_members_path
  end

  #CSV出力 
  def vital 
    @vitals = Vital.all
    respond_to do |format|
      format.html
      format.csv do |csv|
        csv_download(@vitals)
      end
    end
  end

  def csv_download(vitals)
      csv_data = CSV.generate(row_sep: "\r\n", encoding:Encoding::CP932)  do |csv|
        header = %w(日付 体温　血圧(下) 血圧(上) 脈拍 呼吸回数 sp02)
        csv << header
        vitals.each do |vital|
          values = [vital.measuring_date, vital.temperature, vital.low_blood_pressure, vital.hign_blood_pressure, vital.pulse, vital.breathing, vital.spo2]
          csv << values
        end
      end
      send_data(csv_data, filename: "vital.csv")
  end
  #CSV出力終わり

  private

  def caregiver_params
    params.require(:caregiver).permit(:name, :age, :password, :password_confirmation)
  end

  def set_caregiver
    @caregiver = Caregiver.find(params[:id])
  end

end
