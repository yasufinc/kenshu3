class Tweet < ApplicationRecord

  belongs_to :user

  enum publicity: {"全体公開":0, "フォロワーのみに公開":1, "非公開":2}


end
