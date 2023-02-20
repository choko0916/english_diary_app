FactoryBot.define do
  factory :word do
    association :user
    association :diary
    japanese_word { Faker::Emotion.unique.noun }
    english_word { Faker::Hobby.unique.activity }
  end
end
