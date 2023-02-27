require "rails_helper"

RSpec.describe "Homes" do
  describe "GET /index" do
    it "returns http success" do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /" do
    let(:login_user) { create(:user) }

    before do
      sign_in login_user
    end

    it "returns http success" do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end
end
