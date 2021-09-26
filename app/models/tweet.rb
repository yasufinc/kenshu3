class Tweet < ApplicationRecord

  has_many_attached :images

  MAX_IMAGES_COUNT = 3

  validate :images_count_limit

  private

    def images_count_limit
      errors.add(:base, "写真は#{MAX_IMAGES_COUNT}枚まで") if self.images.count > MAX_IMAGES_COUNT
    end

<<<<<<< HEAD
  enum publicity: {Public: 0, Follower_only: 1, Private: 2}




=======
>>>>>>> 65669a7 (写真投稿機能作成)
end
