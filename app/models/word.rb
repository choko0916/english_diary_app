class Word < ApplicationRecord
  belongs_to :user
  belongs_to :diary
  has_many :exam_questions, dependent: :destroy
  validates :japanese_word, presence: true
  validates :english_word, presence: true
end
