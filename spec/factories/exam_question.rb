FactoryBot.define do
  factory :exam_question do
    association :exam
    association :word
    is_correct { Faker::Boolean.boolean }
  end
end
