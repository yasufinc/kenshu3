class TweetsController < ApplicationController
  #before_action :set_twitter

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    #@tweet = MyThread.create(tweet_params)
    #@tweet = MyThread.new(tweet_params)
    # binding.pry
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      redirect_to tweets_path, notice: "新規Tweetが作成されました"
    else
      flash.now[:alert] = "失敗しました"
      render :new #new.html.erbに飛んでくれる
    end

  end



  private
    def set_twitter
      @twitter = Twitter.find(params[:id])
    end

    def tweet_params
      params.require(:tweet).permit(:content, :publicity)
    end








end
