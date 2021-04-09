class Caregiver::LoginRecordsController < Caregiver::Base

  def index
    if params[:caregiver_id]
      @caregiver = Caregiver.find(params[:caregiver_id])
      @login_records = @caregiver.login_records.includes([:caregiver]).order(created_at: :desc)
    else
      @login_records = LoginRecord.includes([:caregiver]).order(created_at: :desc)
    end
      @login_records = @login_records.includes([:caregiver]).page(params[:page])
  end
  
end
