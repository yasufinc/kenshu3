class AddIndexToTweetLikes < ActiveRecord::Migration[6.1]
  def change
    add_index :tweet_likes, [:tweet_id, :user_id], unique: true
  end
end
