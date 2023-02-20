FactoryBot.define do
  factory :diary do
    association :user
    japanese_diary { Faker::Creature::Animal.unique.name }
    english_diary { Faker::TvShows::Friends.unique.character }
    photo { Faker::Avatar.unique.image }
    private_flag { Faker::Boolean.boolean }
    created_at { Faker::Date.unique.in_date_period }
  end
end
