class Tweet < ApplicationRecord

  belongs_to :user

  enum publicity: {Public: 0, Follower_only: 1, Private: 2}




end
