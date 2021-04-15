class Family::Api::MemosController < ApplicationController
  def index
    @memos = Memo.order(created_at: :desc)
  end

  def create
    @memo = Memo.new(memo_params)
    if @memo.save
      render :show, status: :created
    else
      render json: @memo.errors, status: :unprocessable_entity
    end
  end
 
  private
    def memo_params
      params.require(:memo).permit(:title, :description)
    end

end
