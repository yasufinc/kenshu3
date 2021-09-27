class Tweet < ApplicationRecord

  has_many :comments, dependent: :destroy
  has_many_attached :images, dependent: :destroy
  has_many :tweet_likes, dependent: :destroy
  belongs_to :user
  enum publicity: { everybody: 0, only_followers: 1, only_me: 2 }

  MAX_IMAGES_COUNT = 3
  validate :images_count_limit
  validates :content, { presence: true, length: { maximum: 140 } }


  def liked_by?(user)
    tweet_likes.where(user_id: user.id).exists?
  end

  private

    def images_count_limit
      errors.add(:base, "写真は#{MAX_IMAGES_COUNT}枚まで") if self.images.count > MAX_IMAGES_COUNT
    end
end
