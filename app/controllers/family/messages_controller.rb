class Family::MessagesController < Family::Base

  def index 
    @messages = current_family.inbound_messages.includes([:caregiver]).where(discarded: false).sorted.page(params[:page])
  end

  def new
    @message = FamilyMessage.new
  end

  def show
    @message = current_family.inbound_messages.includes([:caregiver]).find(params[:id])
  end

  def create 
    @message = FamilyMessage.new(family_message_params)
    @message.family = current_family
    @message.caregiver_id = 1
    if @message.save!
      flash.notice = "お問い合わせを送信しました。"
      redirect_to family_families_path
    else
      flash.now.alert = "入力に誤りがあります。"
      render :new
    end
  end

  def confirm 
    @message = FamilyMessage.new(family_message_params)
    @message.family = current_family
    if @message.valid?
      render :confirm
    else
      flash.now.aler = "入力に誤りがあります。"
    end
  end

 def destroy
  message = current_family.inbound_messages.find(params[:id])
  message.update_column(:discarded, true)
  flash.notice = "メッセージを削除しました。"
  redirect_back(fallback_location: :family_messages)
 end

  private def family_message_params
    params.require(:form).permit(:subject, :body)
  end

end
