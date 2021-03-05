require 'rails_helper'

RSpec.describe "CareRecipitent::Meals", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/care_recipitent/meals/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/care_recipitent/meals/show"
      expect(response).to have_http_status(:success)
    end
  end

end
