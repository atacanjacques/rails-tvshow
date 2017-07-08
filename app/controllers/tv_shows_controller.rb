class TvShowsController < ApplicationController
  before_action :set_tv_show, only: [:show, :edit, :update, :destroy, :add_user_tv_show, :remove_user_tv_show]
  load_and_authorize_resource

  def index
    @tv_shows = TvShow.paginate(page: params[:page], per_page: 5)
  end

  def show
    @episodes = Episode.where(tv_show_id: params[:id]).paginate(page: params[:page], per_page: 5)
    @my_episodes = UserEpisode.where(user_id: current_user).paginate(page: params[:page], per_page: 5)
  end

  def new
    @tv_show = TvShow.new
  end

  def edit
  end

  def create
    @tv_show = TvShow.new(tv_show_params)

    if @tv_show.save
      flash[:success] = "La série a été ajoutée avec succès."
      redirect_to @tv_show
    else
      render :new
    end
  end

  def update
    if @tv_show.update(tv_show_params)
      flash[:success] = "La série a été modifiée avec succès."
      redirect_to @tv_show
    else
      render :edit
    end
  end

  def destroy
    @tv_show.destroy
    flash[:danger] = "La série a été supprimée avec succès."
    redirect_to tv_shows_url
  end

  def my_tv_shows
    @my_tv_shows = UserTvShow.where(user_id: current_user).paginate(page: params[:page], per_page: 5)
    @tv_shows = TvShow.all
  end

  def add_user_tv_show
    UserTvShow.create!({:user => current_user, :tv_show => @tv_show })
    flash[:success] = "La série a été ajoutée à votre compte avec succès."
    redirect_back(fallback_location: tv_shows_url)
  end

  def remove_user_tv_show
    UserTvShow.destroy_all(user: current_user, tv_show: @tv_show)
    flash[:danger] = "La série a été supprimée de votre compte avec succès."
    redirect_back(fallback_location: tv_shows_url)
  end

  private

  def set_tv_show
    @tv_show = TvShow.find(params[:id])
  end

  def tv_show_params
    params.require(:tv_show).permit(:name, :status, :time, :channel_id, genre_ids: [])
  end
end
