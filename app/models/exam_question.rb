class ExamQuestion < ApplicationRecord
  belongs_to :exam
  belongs_to :word
end
