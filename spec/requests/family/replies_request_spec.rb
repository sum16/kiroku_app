require 'rails_helper'

RSpec.describe "Family::Replies", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/family/replies/new"
      expect(response).to have_http_status(:success)
    end
  end

end
