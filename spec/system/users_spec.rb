require "rails_helper"

RSpec.describe "サインアップページ" do
  let!(:user) { create(:user) }

  before do
    visit new_user_registration_path
  end

  it "必要項目を入力し、登録ボタンをクリックすると、Homeに移動すること" do
    fill_in "username", with: user.username
    fill_in "email", with: user.email
    fill_in "password", with: user.password
    fill_in "password_confirmation", with: user.password_confirmation

    click_on "Sign up"

    expect(page).to have_current_path root_path, ignore_query: true
  end
end

# require 'rails_helper'

# RSpec.describe "商品詳細ページ", type: :system do
#   let(:taxon1) { create(:taxon, name: 'Shirts', id: 1) }
#   let(:taxon2) { create(:taxon, name: 'Solidus', id: 2) }
#   let(:product) { create(:product, name: 'SOLIDUS T-SHIRT', taxons: [taxon1, taxon2]) }
#   let!(:related_products) do
#     %w(10 20 30 40).map do |price_amount|
#       create(:product, taxons: [taxon2], price: price_amount)
#     end
#   end

#   before do
#     visit potepan_product_path(product.id)
#   end

#   it "商品の必要な項目がトップに表示されていること" do
#     within ".singleProduct" do
#       expect(page).to have_content product.name
#       expect(page).to have_content product.display_price
#       expect(page).to have_content product.description
#     end
#   end

#   it "関連商品が適切に表示されていること" do
#     related_products.all? do |related_product|
#       expect(page).to have_content related_product.name
#       expect(page).to have_content related_product.display_price
#     end
#   end

#   it "関連商品をクリックすると、その商品詳細ページに移動すること" do
#     within ".productsContent" do
#       related_products.all? do |related_product|
#         click_on related_product.name
#         expect(current_path).to eq potepan_product_path(related_product.id)
#       end
#     end
#   end

#   it "「一覧ページへ戻る」をクリックすると、商品カテゴリー一覧ページに移動すること" do
#     click_on "一覧ページへ戻る"
#     expect(current_path).to eq potepan_category_path(taxon1.id)
#   end

#   it "Homeボタンをクリックすると、Homeに移動すること" do
#     within ".pageHeader" do
#       click_on "Home"
#       expect(current_path).to eq potepan_path
#     end
#   end
# end
