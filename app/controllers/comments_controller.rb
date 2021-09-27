class CommentsController < ApplicationController
  before_action :set_tweet

  def create
    @comment = current_user.comments.build(content: comment_params[:content], tweet: @tweet)
    @comment.save
    redirect_to @tweet, notice: '新しいコメントが作成されました'
  end

  private

    def set_tweet
      @tweet = Tweet.find(params[:tweet_id])
    end


    def comment_params
      params.require(:comment).permit(:content)
    end



end
