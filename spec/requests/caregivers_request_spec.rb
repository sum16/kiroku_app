require 'rails_helper'

RSpec.describe "Caregivers", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/caregivers/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/caregivers/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/caregivers/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/caregivers/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/caregivers/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
