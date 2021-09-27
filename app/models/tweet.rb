class Tweet < ApplicationRecord

  has_many_attached :images

  MAX_IMAGES_COUNT = 3

  validate :images_count_limit

  private

    def images_count_limit
      errors.add(:base, "写真は#{MAX_IMAGES_COUNT}枚まで") if self.images.count > MAX_IMAGES_COUNT
    end

  belongs_to :user

  enum publicity: {Public: 0, Follower_only: 1, Private: 2}


end
