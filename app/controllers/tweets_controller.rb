class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[ show edit update destroy ]

  def index
    followers = current_user.following
    tweets_for_everybody = Tweet.everybody
    tweets_for_followers = Tweet.only_followers.where(user_id: followers)
    my_tweets = current_user.tweets
    @tweets= tweets_for_everybody.or(tweets_for_followers).or(my_tweets).distinct.order(id: "DESC")
  end

  def show
    @comments = @tweet.comments.order(id: "DESC")
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
    # check_user
    if not current_user.tweets.find(params[:id])
      redirect_to tweets_path, alert: '不正なアクセスです'
    end
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to tweets_path, notice: 'Tweetが正しく変更されました'
    else
      flash.now[:alert] = 'Tweetの更新に失敗しました。'
      render 'edit'
    end
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice: 'Tweetが削除されました'
  end

  private
    def set_tweet
      @tweet = Tweet.find_by_id(params[:id])

      if @tweet.nil?
        flash.now[:alert] = '該当するTweetがありません'
        redirect_back fallback_location: root_path
      end
    end

    def tweet_params
      params.require(:tweet).permit(:content, :publicity, images: [])
    end

end
