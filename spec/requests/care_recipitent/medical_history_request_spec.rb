require 'rails_helper'

RSpec.describe "CareRecipitent::MedicalHistories", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/care_recipitent/medical_history/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/care_recipitent/medical_history/show"
      expect(response).to have_http_status(:success)
    end
  end

end
