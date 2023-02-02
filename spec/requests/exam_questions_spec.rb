require "rails_helper"

RSpec.describe "ExamQuestions" do
  describe "GET /show" do
    it "returns http success" do
      get "/exam_questions/show"
      expect(response).to have_http_status(:success)
    end
  end
end
