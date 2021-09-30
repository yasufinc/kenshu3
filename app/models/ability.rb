# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user && user.admin_flg == 1
      can :access, :rails_admin
      can :manage, :all
    end
  end
end
