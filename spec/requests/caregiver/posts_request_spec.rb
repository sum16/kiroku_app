require 'rails_helper'

RSpec.describe "Caregiver::Posts", type: :request do

  describe '正常' do
    context "申し送りを投稿する" do
      it "投稿できること" do
        get "/caregiver/posts/new"
        expect(response).to have_http_status(200)
        post "caregiver_posts_path", params: { post: FactoryBot.attributes_for(:post) }
        follow_redirect!
        expect(response.body).to include "申し送りを追加しました"
      end
    end
  end

end
