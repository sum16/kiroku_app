require 'rails_helper'

RSpec.describe "Caregiver::StaffMembers", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/caregiver/staff_members/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/caregiver/staff_members/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/caregiver/staff_members/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
