class Caregiver::MessagesController < Caregiver::Base
  before_action :set_message, only: %i[ show ]

  def index
    @messages = Message.not_deleted.includes([:family]).sorted.page(params[:page])
  end

  #GET
  def inbound
    @messages = FamilyMessage.not_deleted.includes([:family]).sorted.page(params[:page])
    render action: "index"
  end

  #GET
  def outbound
    @messages = CaregiverMessage.not_deleted.includes([:caregiver]).sorted.page(params[:page])
    render :index
  end

  def deleted 
    @messages = Message.deleted.sorted.page(params[:page])
    render :index
  end

  def show
    
  end

  #ゴミ箱へ移動
  def destroy
    message = FamilyMessage.find(params[:id])
    message.update_column(:deleted, true)
    flash.notice = "お問い合わせを削除しました。"
    redirect_back(fallback_location: :caregiver_staff_members)
  end

  private

  def set_message 
    @message = Message.find(params[:id])
  end

end
