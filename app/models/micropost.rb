class Micropost < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  scope :recent_posts, ->{order created_at: :desc}
  validates :user_id, presence: true
  validates :content, presence: true,
                      length: {maximum: Settings.content_maximun}
  validates :image, content_type: {in: Settings.image_type,
                                   message: t("valid_image_format")},
                    size: {less_than: Settings.image_size.megabytes,
                           message: t("valid_image_size")}

  def display_image
    image.variant(resize_to_limit: [Settings.image_size_limit,
      Settings.image_size_limit])
  end
end
