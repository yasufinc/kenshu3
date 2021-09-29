class Comment < ApplicationRecord
  belongs_to :tweet
  belongs_to :user

  validates :content, { presence: true, length: { maximum: 50 } }
end
