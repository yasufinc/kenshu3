class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[ show edit update destroy ]

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      redirect_to tweets_path, notice: "新規Tweetが作成されました"
    else
      flash.now[:alert] = @tweet.errors.full_messages.to_sentence

      render :new #new.html.erbに飛んでくれる
    end

  end


  def edit
    user_check
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to tweets_path, notice: 'Tweetが正しく変更されました'
    else
      render 'edit'
    end
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice: 'Tweetが削除されました'
  end




  private
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    def tweet_params
      params.require(:tweet).permit(:content, :publicity, images: [])
    end

    def user_check
      if current_user.id == @tweet.user_id
        return true
      else
        redirect_to tweets_path
      end
    end







end
