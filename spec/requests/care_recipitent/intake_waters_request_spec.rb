require 'rails_helper'

RSpec.describe "CareRecipitent::IntakeWaters", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/care_recipitent/intake_waters/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/care_recipitent/intake_waters/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/care_recipitent/intake_waters/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/care_recipitent/intake_waters/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/care_recipitent/intake_waters/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
