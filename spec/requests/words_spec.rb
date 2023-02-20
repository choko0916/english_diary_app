require "rails_helper"

RSpec.describe "Words" do
  describe "GET /index" do
    let!(:user) { create(:user) }
    let!(:user_words) { create_list(:word, 3, user_id: user.id) }
    let!(:other_user_words) { create_list(:word, 3) }

    before do
      sign_in user
      get words_path
    end

    it "ログインしている時、ログインユーザーの単語帳ページにアクセスできること" do
      expect(response).to have_http_status(:ok)
    end

    it "ログインユーザーが投稿した単語が表示されていること" do
      expect(response.body).to include(user_words.first.english_word)
      expect(response.body).to include(user_words.second.english_word)
    end

    it "ログインユーザー以外が投稿した単語が表示されていないこと" do
      expect(response.body).not_to include(other_user_words.first.english_word)
      expect(response.body).not_to include(other_user_words.second.english_word)
    end
  end
end
