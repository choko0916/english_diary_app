FactoryBot.define do
  factory :diary do
    japanese_diary { Faker::Quote.singular_siegler }
    english_diary { Faker::Quote.famous_last_words }
    photo { Faker::Avatar.image }
    created_at { Faker::Date }
  end
end
