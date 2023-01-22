class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  validates :avatar, content_type: { in: %w[image/jpeg image/gif image/png],
                                     message: "有効なフォーマットではありません" },
                     size: { less_than: 5.megabytes, message: " 5MBを超える画像はアップロードできません" }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.confirmed_at = Time.current
      user.username = "ゲスト"
    end
  end
end
