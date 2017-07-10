class UsersExtendController < ApplicationController
  before_action :set_friendship, only: [:index, :show]

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def show
    @user = User.where(username: params[:username]).first
    @my_tv_shows = UserTvShow.where(user_id: @user).paginate(page: params[:page], per_page: 5)
    @tv_shows = TvShow.all
  end

  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      flash[:danger] = "Utilisateur supprimé."
      redirect_back(fallback_location: tv_shows_url)
    end
  end

  def add_friend
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    @friendship.save
    flash[:success] = "La série a été ajoutée à votre compte avec succès."
    redirect_back(fallback_location: tv_shows_url)
  end

  def remove_friend
    @friendship = current_user.friendships.where(friend_id: params[:friend_id])
    @friendship.destroy_all
    flash[:danger] = "La série a été supprimée de votre compte avec succès."
    redirect_back(fallback_location: tv_shows_url)
  end

  private

  def set_friendship
    @friendships = Friendship.all
  end
end
