class Tweet < ApplicationRecord

  has_many_attached :images
  belongs_to :user
  enum publicity: {everybody: 0, only_followers: 1, only_me: 2}

  MAX_IMAGES_COUNT = 3

  validate :images_count_limit
  validates :content, presence: true 

  private

    def images_count_limit
      errors.add(:base, "写真は#{MAX_IMAGES_COUNT}枚まで") if self.images.count > MAX_IMAGES_COUNT
    end
end
