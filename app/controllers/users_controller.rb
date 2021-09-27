class UsersController < ApplicationController

    def show
      @tweets = Tweet.where(user_id: params[:id])
    end

end