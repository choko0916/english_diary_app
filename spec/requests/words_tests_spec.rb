require 'rails_helper'

RSpec.describe "WordsTests", type: :request do
  describe "GET /test" do
    it "returns http success" do
      get "/words_tests/test"
      expect(response).to have_http_status(:success)
    end
  end

end
