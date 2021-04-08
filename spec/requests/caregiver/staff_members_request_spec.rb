require 'rails_helper'

RSpec.describe "Caregiver", type: :request do

  describe "正常" do
    context "職員情報を登録する" do
      it "登録できること" do
        get "/caregiver/staff_members/new"
        expect(response).to have_http_status(200)

        post "/caregiver/staff_members", params: { caregiver: FactoryBot.attributes_for(:caregiver_sato) }
        follow_redirect!
        expect(response.body).to include "登録が完了しました"
      end
    end
  end


end
