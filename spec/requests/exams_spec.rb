require "rails_helper"

RSpec.describe "Exams" do
  let!(:login_user) { create(:user) }
  let!(:another_user) { create(:user) }
  let!(:exam1) { create(:exam, user: login_user) }
  let!(:user_word) { create(:word, user: login_user) }
  let(:another_user_word) { create(:word, user: another_user) }
  let!(:exam_question1) { create(:exam_question, exam: exam1, word: user_word) }

  before do
    sign_in login_user
  end

  describe "GET /new" do
    it "returns http success" do
      get "/exams/new"
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /create" do
    context "パラメータが妥当な場合" do
      it "リクエストが成功すること" do
        post exams_path, params: { exam: exam1 }
        expect(response).to have_http_status :found
      end

      it "リクエストが成功すると、examsテーブル、exam_questionsテーブルにデータが１件ずつ登録されること" do
        expect do
          post exams_path, params: { exam: exam1 }
        end.to change(Exam, :count).by(1).and change(ExamQuestion, :count).by(1)
        binding.pry
      end

      it "テストページで、ログインユーザーが登録した単語から単語が一つ表示されること" do
        get exam_question_path(exam_question1.id)
        expect(response.body).to include(user_word.japanese_word)
      end
    end
  end

  describe "GET /show" do
    let!(:correct_exam_questions) { create_list(:exam_question, 5, is_correct: true, exam: exam1) }
    let!(:wrong_exam_questions) { create_list(:exam_question, 5, is_correct: false, exam: exam1) }

    before do
      get exam_path(exam1.id)
    end

    it "returns http success" do
      expect(response).to have_http_status(:ok)
    end

    it "単語テストで正解であった問題を取得できること" do
      expect(response.body).to include(correct_exam_questions.first.word.english_word)
      expect(response.body).to include(correct_exam_questions.last.word.english_word)
    end

    it "単語テストで不正解であった問題を取得できること" do
      expect(response.body).to include(wrong_exam_questions.first.word.english_word)
      expect(response.body).to include(wrong_exam_questions.last.word.english_word)
    end
  end
end
