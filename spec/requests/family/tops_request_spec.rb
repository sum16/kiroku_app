require 'rails_helper'

RSpec.describe "Family::Tops", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/family/tops/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/family/tops/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/family/tops/new"
      expect(response).to have_http_status(:success)
    end
  end

end
