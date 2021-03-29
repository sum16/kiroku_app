require 'rails_helper'

RSpec.describe "Family::Youtubes", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/family/youtubes/index"
      expect(response).to have_http_status(:success)
    end
  end

end
