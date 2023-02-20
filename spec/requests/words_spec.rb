require "rails_helper"

RSpec.describe "Words" do
  describe "GET /index" do
    it "returns http success" do
      get "/words/index"
      expect(response).to have_http_status(:success)
    end
  end
end
