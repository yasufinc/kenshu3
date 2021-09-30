class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # rescue_from ::CanCan::AccessDenied do
  #   # redirect_to tweets_path
  #   render 'new'
  # end
end
