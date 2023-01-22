class Diary < ApplicationRecord
  belongs_to :user
  validates :english_diary, presence: true
end
