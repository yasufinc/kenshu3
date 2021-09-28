class TweetLikesController < ApplicationController
    before_action :set_tweet

    def create
        tweetlike = TweetLike.new(user_id: current_user.id, tweet_id: @tweet.id)
        unless tweetlike.save
            flash.now[:alert] = tweetlike.errors.full_messages.to_sentence
        end
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