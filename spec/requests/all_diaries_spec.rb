require "rails_helper"

RSpec.describe "AllDiaries" do
  describe "GET /index" do
    let!(:open_diaries) do
      %w(10 20 30 40).map do |created_at|
        create(:diary, private_flag: false, created_at: created_at)
      end
    end
    let(:private_diaries) { create_list(:diary, 4, private_flag: true) }

    before do
      get all_diaries_path
    end

    it "returns http success" do
      binding.pry
      expect(response).to have_http_status(:success)
    end

    it "公開の日記が作成日の降順で表示されていること" do
      expect(response.body).to include(private_diaries)
    end

    it "非公開の日記が公開されていないこと" do
      expect(response.body).not_to include(private_diaries)
    end
  end
end
