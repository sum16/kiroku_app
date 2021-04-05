require 'rails_helper'

RSpec.describe "Caregiver::Replies", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/caregiver/replies/new"
      expect(response).to have_http_status(:success)
    end
  end

end
