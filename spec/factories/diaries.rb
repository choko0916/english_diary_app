FactoryBot.define do
  factory :diary do
    association :user
    japanese_diary { Faker::Quote.singular_siegler }
    english_diary { Faker::Quote.famous_last_words }
    photo { Faker::Avatar.image }
    private_flag { Faker::Boolean.boolean }
    created_at { Faker::Date }
  end
end
