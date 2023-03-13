class Owner < ApplicationRecord

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  mount_uploader :image, ImageUploader

  has_many :letters
  has_many :likes

  def full_name
    "#{first_name} #{last_name}"
  end

  def total_followers
    Follower.where(follower_id: self.id).count
  end

  def total_following
    Follower.where(following_id: self.id).count
  end
end
