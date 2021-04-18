class Caregiver::ShareButtonsController < Caregiver::Base
  def create
    @share_button = current_caregiver_member.share_buttons.create(post_id: params[:post_id])

  end

  def destroy
    post = Post.find(params[:post_id])
    share_button = current_caregiver_member.share_buttons.find_by(post_id: post.id)
    share_button.destroy
  end

end
