class Diary < ApplicationRecord
  belongs_to :user
  has_many :words, dependent: :destroy
  validates :english_diary, presence: true
  mount_uploader :photo, PhotoUploader
end
