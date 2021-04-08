require 'rails_helper'

RSpec.describe "Family::Accounts", type: :request do

  describe "職員の自分のアカウント管理" do

    before do
      post family_session_url,
        params: {
          family_login_form: {
            family_name: "佐藤",
            given_name: "太郎",
            password: "password"
          }
        }
    end

    describe "更新" do
      let(:params_hash) { attributes_for(:family) }
      let(:family) { create(:family) }

      it "名字を変更する" do
        params_hash.merge!(family_name: "近藤")
        patch family_account_url(family),
        params: { id: family.id, family: params_hash }
        family.reload 
        expect(family.family_name).to eq("近藤")
      end

      it "例外ActionController::ParameterMissing発生" do
        expect { patch family_account_url, params: { id: family_id }}.
        to raise_error(ActionController::ParameterMissing)
      end

    end
  end
end
