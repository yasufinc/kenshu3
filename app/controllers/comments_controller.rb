class CommentsController < ApplicationController
  before_action :set_tweet
  before_action :set_comment, only: %i[ edit update destroy ]

  def create
    @comment = current_user.comments.build(content: comment_params[:content], tweet: @tweet)
    if @comment.save
      redirect_to @tweet, notice: '新しいコメントが作成されました'
    else
      flash.now[:alert] = @comment.errors.full_messages.to_sentence
      render :show 
    end
  end

  def edit
    unless current_user.comments.find(params[:id])
      redirect_to @tweet, alert: '不正なアクセスです'
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to @tweet, notice: 'コメントが正しく変更されました'
    else
      flash.now[:alert] = 'コメントの更新に失敗しました。'
      render 'edit'
    end
  end

  def destroy
    if current_user.id == @comment.user_id
      @comment.destroy
      redirect_to @tweet, notice: 'コメントが削除されました'
    else
      redirect_to @tweet, alert: 'コメントを削除できません'
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
