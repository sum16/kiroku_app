class Caregiver::RepliesController < Caregiver::Base
   before_action :prepare_message

  def new
    @reply = CaregiverMessage.new
  end

  def confirm 
    @reply = CaregiverMessage.new(caregiver_params)
    @reply.caregiver = current_caregiver_member
    @reply.parent_id = @message.parent_id 
    if @reply.valid?
      render :"confirm"
    else
      flash.now.alert = "入力に誤りがあります。"
      render :new
    end
  end

  def create 
    @reply = CaregiverMessage.new(caregiver_params)
    @reply.caregiver = current_caregiver_member
    @reply.family_id = 3
    @reply.parent_id = @message.id
    if @reply.save! 
      flash.notice = "問い合わせに返信しました。"
      redirect_to :outbound_caregiver_messages
    else
      flash.now.alert = "入力に誤りがあります。"
      render :new
    end
  end


  private def prepare_message 
    @message = FamilyMessage.find(params[:message_id])
  end

  private def caregiver_params
    params.require(:caregiver_message).permit(:subject, :body)
  end

end
