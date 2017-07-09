class UsersExtendController < ApplicationController
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def show
    @user = User.where(username: params[:username]).first
    @my_tv_shows = UserTvShow.where(user_id: @user).paginate(page: params[:page], per_page: 5)
    @tv_shows = TvShow.all
  end
end
