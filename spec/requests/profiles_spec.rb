require "rails_helper"

RSpec.describe "Profiles" do
  let(:login_user) { create(:user) }

  before do
    sign_in login_user
  end

  describe "GET /edit" do
    it "returns http success" do
      get edit_profiles_path
      expect(response).to have_http_status(:success)
    end
  end
end
