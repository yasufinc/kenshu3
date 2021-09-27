class TweetLikesController < ApplicationController
    before_action :set_tweet
    before_action :set_tweet_like

    def create
        TweetLike.create(user_id: current_user.id, tweet_id: @tweet.id)
        redirect_back fallback_location: root_path
    end

    def destroy
        @tweet_like&.delete
        redirect_back fallback_location: root_path
    end

    private

    def set_tweet
        @tweet = Tweet.find(params[:tweet_id])
    end

    def set_tweet_like
        @tweet_like = TweetLike.find_by(user_id: current_user.id, tweet_id: @tweet.id)
    end
end