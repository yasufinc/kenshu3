class RelationshipsController < ApplicationController
  before_action :set_user
  before_action :set_relationship

  def create
    unless @relationship.present?
        Relationship.create(follower_id: current_user.id, followed_id: @user.id)
    end
    redirect_back fallback_location: root_path
  end

  def destroy
      if @relationship.present?
          @relationship.delete
      end
      redirect_back fallback_location: root_path
  end

  private

    def set_user
        @user = User.find(params[:user_id])
    end

    def set_relationship
        @relationship = Relationship.find_by(follower_id: current_user.id, followed_id: @user.id)
    end
end