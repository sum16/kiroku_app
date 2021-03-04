require 'rails_helper'

RSpec.describe "CareRecipitent::Medicines", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/care_recipitent/medicines/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/care_recipitent/medicines/show"
      expect(response).to have_http_status(:success)
    end
  end

end
