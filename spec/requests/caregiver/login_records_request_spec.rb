require 'rails_helper'

RSpec.describe "Caregiver::LoginRecords", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/caregiver/login_records/index"
      expect(response).to have_http_status(:success)
    end
  end

end
