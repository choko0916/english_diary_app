require "rails_helper"

RSpec.describe "Diaries" do
  describe "GET /index" do
    let!(:user) { create(:user) }
    let!(:another_user) { create(:user) }
    let!(:user_diaries) do
      %w[10 20 30].map do |created_at|
        create(:diary, user_id: user.id, created_at:)
      end
    end
    let!(:another_user_diaries) { create_list(:diary, 3, user_id: another_user.id) }

    before do
      sign_in user
      get diaries_path
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "ユーザーが投稿した日記が表示されていること" do
      expect(response.body).to include(user_diaries.first.english_diary)
      expect(response.body).to include(user_diaries.second.english_diary)
      expect(response.body).to include(user_diaries.last.english_diary)
    end

    it "ユーザーが投稿した日記がcreted_at（投稿日時）の降順に公開されていること" do
      expect(response.body.index(user_diaries[0].english_diary)).to be > (response.body.index(user_diaries[1].english_diary))
    end

    it "ユーザー以外の日記が公開されていないこと" do
      expect(response.body).not_to include(another_user_diaries.first.english_diary)
      expect(response.body).not_to include(another_user_diaries.second.english_diary)
      expect(response.body).not_to include(another_user_diaries.last.english_diary)
    end
  end
end
