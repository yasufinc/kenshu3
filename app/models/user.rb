class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :tweet_likes, dependent: :destroy
  has_many :relationships, foreign_key: "followed_id", dependent: :destroy

  def followed_by?(user)
    relationships.where(follower_id: user.id).exists?
  end

end
