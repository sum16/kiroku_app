require 'rails_helper'

RSpec.describe "Caregiver::Posts", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/caregiver/posts/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/caregiver/posts/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/caregiver/posts/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/caregiver/posts/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
