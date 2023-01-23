class Diary < ApplicationRecord
  belongs_to :user
  validates :english_diary, presence: true
  mount_uploader :photo, PhotoUploader
end
