require "rails_helper"

RSpec.describe "Homes" do
  describe "GET /index" do
    it "returns http success" do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/homes/show"
      expect(response).to have_http_status(:success)
    end
  end
end
