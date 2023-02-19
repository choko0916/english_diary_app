require "rails_helper"

RSpec.describe "AllDiaries" do
  describe "GET /index" do
    let!(:open_diaries) do
      %w[10 20].map do |created_at|
        create(:diary, private_flag: false, created_at:)
      end
    end
    let(:private_diaries) { create_list(:diary, 2, private_flag: true) }

    before do
      get all_diaries_path
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "公開の日記が表示されていること" do
      expect(response.body).to include(open_diaries.first.english_diary)
      expect(response.body).to include(open_diaries.second.english_diary)
    end

    it "公開の日記がcreted_at（投稿日時）の降順に公開されていること" do
      expect(response.body.index(open_diaries[0].english_diary)).to be > (response.body.index(open_diaries[1].english_diary))
    end

    it "非公開の日記が公開されていないこと" do
      expect(response.body).not_to include(private_diaries.first.english_diary)
      expect(response.body).not_to include(private_diaries.second.english_diary)
    end
  end
end
