class TweetsController < ApplicationController
  #before_action :set_twitter

  def index
    @tweets = Tweet.all
  end

  # private
  #   def set_twitter
  #     @twitter = Twitter.find(params[:id])
  #   end








end
