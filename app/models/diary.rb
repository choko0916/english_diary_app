class Diary < ApplicationRecord
  belongs_to :user
  has_many :words, dependent: :destroy
  accepts_nested_attributes_for :words, allow_destroy: true
  validates :english_diary, presence: true
  mount_uploader :photo, PhotoUploader
end
