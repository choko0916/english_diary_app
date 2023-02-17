require "rails_helper"

RSpec.describe "AllDiaries" do
  describe "GET /index" do
    let(:open_diary) { create(:diary, private_flag: false) }
    let(:private_diary) { create(:diary, private_flag: true) }

    before do
      get all_diaries_path
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "公開の日記が表示されていること" do
      expect(response.body).to include(private_diary)
    end

    it "非公開の日記が公開されていないこと" do
      expect(response.body).not_to include(private_diary)
    end
  end
end
