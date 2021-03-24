require 'rails_helper'

RSpec.describe "Family::Registrations", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/family/registrations/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/family/registrations/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/family/registrations/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/family/registrations/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
