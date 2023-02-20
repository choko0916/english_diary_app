FactoryBot.define do
  factory :diary do
    association :user
    japanese_diary { Faker::Quote.singular_siegler }
    english_diary { Faker::Coffee.unique.blend_name }
    photo { Faker::Avatar.image }
    private_flag { Faker::Boolean.boolean }
    created_at { Faker::Date.in_date_period }
  end
end
