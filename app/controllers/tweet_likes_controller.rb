class TweetLikesController < ApplicationController
    before_action :set_tweet

    def create
        TweetLike.create(user_id: current_user.id, tweet_id: @tweet.id)
        redirect_back fallback_location: root_path
    end

    def destroy
        TweetLike.where(user_id: current_user.id, tweet_id: @tweet.id).destroy_all
        redirect_back fallback_location: root_path
    end

    private

    def set_tweet
        @tweet = Tweet.find(params[:tweet_id])
    end
end