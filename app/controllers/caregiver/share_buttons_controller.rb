class Caregiver::ShareButtonsController < Caregiver::Base
  before_action :post_params
  def create
    current_caregiver_member.share_buttons.create(post_id: params[:post_id])
  end

  def destroy
    current_caregiver_member.share_buttons.find_by(post_id: @post.id)
  end

  private

  def post_params
    @post = Post.find(params[:id])
  end

end
