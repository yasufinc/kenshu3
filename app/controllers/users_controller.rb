class UsersController < ApplicationController

    def show
      @tweets = Tweet.where(user_id: params[:id]).order(id: "DESC") ## idの降順
      @user = User.find_by(id: params[:id])
    end

end