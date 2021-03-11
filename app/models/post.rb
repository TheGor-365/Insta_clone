class Post < ApplicationRecord

  default_scope { order created_at: :desc }
  before_create :set_active

  scope :active, -> { where active: true }

  mount_uploader :image, ImageUploader

  belongs_to :account
  has_many :likes
  has_many :comments

  private

  def set_active
    self.active = true
  end

end
