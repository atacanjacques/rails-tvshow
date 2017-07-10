class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role? :simple_user
      can [:read, :my_tv_shows, :add_user_tv_show, :remove_user_tv_show], TvShow
      can [:show, :add_user_episode, :remove_user_episode], Episode
    end

    can :manage, :all if user.has_role? :admin
  end
end
