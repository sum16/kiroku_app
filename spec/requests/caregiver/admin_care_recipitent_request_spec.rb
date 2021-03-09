require 'rails_helper'

RSpec.describe "Caregiver::AdminCareRecipitents", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/caregiver/admin_care_recipitent/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/caregiver/admin_care_recipitent/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/caregiver/admin_care_recipitent/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/caregiver/admin_care_recipitent/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
