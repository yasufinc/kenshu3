class CommentsController < ApplicationController
  before_action :set_tweet
  before_action :set_comment, only: %i[ edit update destroy ]

  def create
    @comment = current_user.comments.build(content: comment_params[:content], tweet: @tweet)
    @comment.save
    redirect_to @tweet, notice: '新しいコメントが作成されました'
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to @tweet, notice: 'コメントが正しく変更されました'
    else
      render 'edit', notice: 'コメントの変更に失敗しました。'
    end
  end

  private

    def set_tweet
      @tweet = Tweet.find(params[:tweet_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end


    def comment_params
      params.require(:comment).permit(:content)
    end



end
