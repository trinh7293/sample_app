class Micropost < ApplicationRecord
  belongs_to :user

  scope :ordered, -> {order created_at: :desc}
  scope :microposts_feeds, ->user{where user_id: user.following_ids << user.id}

  mount_uploader :picture, PictureUploader

  validates :user, presence: true
  validates :content, presence: true, length: {maximum: 140}
  validate :picture_size

  private
  def picture_size
    if picture.size > 5.megabytes
      errors.add :picture, t("less_5mb")
    end
  end
end
