FactoryBot.define do
  factory :diary do
    association :user
    japanese_diary { Faker::Emotion.unique.adjective }
    english_diary { Faker::Coffee.unique.blend_name }
    photo { Faker::Avatar.unique.image }
    private_flag { Faker::Boolean.boolean }
    created_at { Faker::Date.unique.in_date_period }
  end
end
