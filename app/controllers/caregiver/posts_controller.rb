class Caregiver::PostsController < Caregiver::Base
  before_action :set_post, only: %i[ show edit ]

  def index
    @posts = Post.order(created_at: :desc).includes(:caregiver).page(params[:page])
  end

  def new
    @post = Post.new
  end

  def create 
    @post = Post.new(post_params)
    @post.caregiver = current_caregiver_member
    if @post.save
      flash.notice = "申し送りを追加しました"
      redirect_to caregiver_posts_path
    else
      render :new
      flash.now.alert = "入力に誤りがあります。"
    end
  end

  def show
    @share_button = current_caregiver_member.share_buttons.find_or_initialize_by(post: @post)
  end

  def edit
  end

  def update 
       post = Post.find(params[:id])
    if post.update!(post_params)
       flash.notice = "申し送りを追加しました"
       redirect_to caregiver_staff_member_posts_path(current_caregiver_member, post.id)
    else
      render :new
      flash.now.alert = "入力に誤りがあります。"
    end
  end

  def destroy
     post = Post.find(params[:id])
     post.destroy
  end


  
  private

  def post_params
      params.require(:post).permit(:title, :body)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
