require "rails_helper"

RSpec.describe "Profiles" do
  describe "GET /update" do
    it "returns http success" do
      get "/profiles/update"
      expect(response).to have_http_status(:success)
    end
  end
end
