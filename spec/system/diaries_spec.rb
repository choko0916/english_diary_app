require "rails_helper"

RSpec.describe "日記投稿ページ" do
  let!(:english_diary) { create(:english_diary) }

  before do
    visit new_diary_path
  end

  it "必要項目（「日記（英語）」）を入力し、登録ボタンをクリックすると、ユーザーの日記一覧ページに移動すること" do
    fill_in "日記（英語）", with: english_diary
    click_on "登録"
    expect(current_path).to eq diaries_path
  end

  # it "「単語、フレーズを追加する」ボタンを押すと、日本語・英語の単語、フレーズ入力欄、メモ入力欄がボタンを押した回数だけ表示されること" do
  # end

  # it "「英語日記」、「日本語の単語・フレーズ」、「英語の単語・フレーズ」を入力し、登録ボタンを押すと、登録に成功し、ユーザーの日記一覧ページに遷移すること" do
  # end

  # it "「日本語の単語・フレーズ」または「英語の単語・フレーズ」を入力せずに、登録ボタンをクリックすると、エラーメッセージが表示され、ページ遷移しないこと" do
  # end
end
