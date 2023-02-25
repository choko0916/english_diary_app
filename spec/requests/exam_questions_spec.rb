require "rails_helper"

RSpec.describe "ExamQuestions" do
  let!(:login_user) { create(:user) }
  let!(:exam1) { create(:exam, user: login_user) }
  let!(:exam_question1) { create(:exam_question, exam: exam1) }

  before do
    sign_in login_user
  end

  describe "GET /show" do
    it "returns http success" do
      get exam_question_path(exam_question1.id)
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /update" do
    let!(:exam3) { create(:exam, exam_questions: less_than_ten_exam_questions) }
    let!(:less_than_ten_exam_questions) { create_list(:exam_question, 8, word: sample, is_correct: nil) }
    let!(:sample) { login_user_words.sample }
    let!(:login_user_words) { create_list(:word, 10, user: login_user) }

    context "単語テスト10問目が終了した場合" do
      let!(:ten_exam_questions) { create_list(:exam_question, 10) }
      let!(:exam2) { create(:exam, exam_questions: ten_exam_questions) }

      it "単語テスト結果ページに遷移すること" do
        patch exam_question_path(exam2.exam_questions.last.id),
              params: { exam_question: { english_word: exam2.exam_questions.last.word.english_word } }
        expect(response).to redirect_to exam_path(exam2.id)
      end
    end

    context "単語テストが10問目以下の場合" do
      it "exam_questionsテーブルに新しいデータが１件登録されること" do
        expect do
          patch exam_question_path(exam3.exam_questions.last.id),
                params: { exam_question: { english_word: exam3.exam_questions.last.word.english_word } }
        end.to change(ExamQuestion, :count).by(1)
      end
    end

    context "単語テストでの回答が正解であれば" do
      it "is_correctカラムをtrueで上書きすること" do
        patch exam_question_path(exam3.exam_questions.last.id), params: { exam_question: { english_word: sample.english_word } }
        expect(exam3.exam_questions.last.reload.is_correct).to be true
      end
    end

    context "単語テストでの回答が不正解であれば" do
      it "is_correctカラムをfalseで上書きすること" do
        patch exam_question_path(exam3.exam_questions.last.id), params: { exam_question: { english_word: "wrong_answer" } }
        expect(exam3.exam_questions.last.reload.is_correct).to be false
      end
    end
  end
end
