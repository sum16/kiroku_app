require 'rails_helper'

RSpec.describe "Families", type: :request do

  describe '登録できること' do
    context "フォームに登録できる" do
      it "登録できること" do
        get "/family/families/new"
        expect(response).to have_http_status(200)
        post "/family/families", params: { family: FactoryBot.attributes_for(:family) }
        follow_redirect!
        expect(response.body).to include "登録が完了しました"
      end
    end
  end

end
