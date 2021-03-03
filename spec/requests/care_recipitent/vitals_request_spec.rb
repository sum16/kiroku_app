require 'rails_helper'

RSpec.describe "CareRecipitent::Vitals", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/care_recipitent/vitals/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/care_recipitent/vitals/show"
      expect(response).to have_http_status(:success)
    end
  end

end
