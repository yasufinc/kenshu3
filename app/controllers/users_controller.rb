class UsersController < ApplicationController

    def show
      @tweets = Tweet.where(user_id: params[:id]).order(id: "DESC") ## idの降順
      @user = User.find(params[:id])
      @following_or_not = @user.followed_by?(current_user)
    end

end