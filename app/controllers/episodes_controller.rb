class EpisodesController < ApplicationController
  before_action :set_episode, only: [:show, :edit, :update, :destroy, :add_user_episode,:remove_user_episode]

  def index
    @episodes = Episode.paginate(page: params[:page], per_page: 5)
  end

  def show
  end

  def new
    @episode = Episode.new
  end

  def edit
  end

  def create
    @episode = Episode.new(episode_params)

    if @episode.save
      redirect_to @episode
    else
      render :new
    end
  end

  def update
    if @episode.update(episode_params)
      redirect_to @episode
    else
      render :edit
    end
  end

  def destroy
    @episode.destroy
    redirect_to episodes_url
  end

  def my_episodes
    @my_episodes = UserEpisode.where(user_id: current_user).paginate(page: params[:page], per_page: 5)
    @episodes = Episode.all
  end

  def add_user_episode
    UserEpisode.create!({:user => current_user, :episode => @episode })
    redirect_to episodes_url
  end

  def remove_user_episode
    user_episode = UserEpisode.where({:user => current_user, :episode => @episode }).first
    user_episode.destroy
    redirect_to episodes_url
  end

  private

  def set_episode
    @episode = Episode.find(params[:id])
  end

  def episode_params
    params.require(:episode).permit(:season, :episode, :title, :tv_show_id)
  end
end
