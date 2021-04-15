class Caregiver::ShareButtonsController < Caregiver::Base
  
  def index
  end

  def create
    @share_button = current_caregiver_member.share_buttons.create(post_id: params[:post_id])
    if @share_button.save!
       redirect_to caregiver_posts_path
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    share_button = current_caregiver_member.share_buttons.find_by(post_id: post.id)
    share_button.destroy
    redirect_to caregiver_posts_path
  end

end
