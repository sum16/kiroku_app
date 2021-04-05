class Family::RepliesController < Family::Base
  before_action :prepare_message

  def new
    @reply = FamilyMessage.new
  end

  def create 
    @reply = FamilyMessage.new(famiy_message_params)
    @reply.caregiver_id = 1
    @reply.parent_id = @message.id
    if @reply.save!
      flash.notice = "問い合わせに返信しました。"
      redirect_to :family_messages
    else
      flash.now.alert = "入力に誤りがあります。"
      render :new
    end
  end


  private def prepare_message 
    @message = Message.find(params[:message_id])
  end

  private def famiy_message_params
    params.require(:family_message).permit(:subject, :body)
  end

end
