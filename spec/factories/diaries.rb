FactoryBot.define do
  factory :diary do
    association :user
    japanese_diary { Faker::Book.unique.author }
    english_diary { Faker::Book.unique.title }
    photo { Faker::Avatar.unique.image }
    private_flag { Faker::Boolean.boolean }
    created_at { Faker::Date.unique.in_date_period }
  end
end
