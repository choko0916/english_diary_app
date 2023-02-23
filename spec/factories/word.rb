FactoryBot.define do
  factory :word do
    association :user
    association :diary
    japanese_word { Faker::Quote.unique.robin }
    english_word { Faker::Hobby.unique.activity }
  end
end
