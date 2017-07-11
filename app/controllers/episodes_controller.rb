class EpisodesController < ApplicationController
  before_action :set_episode, only: [:show, :edit, :update, :destroy, :add_user_episode,:remove_user_episode]
  load_and_authorize_resource

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
      flash[:success] = "L'épisode a été ajoutée avec succès."
      redirect_to @episode
    else
      render :new
    end
  end

  def update
    if @episode.update(episode_params)
      flash[:success] = "L'épisode a été modifiée avec succès."
      redirect_to @episode
    else
      render :edit
    end
  end

  def destroy
    @episode.destroy
    flash[:danger] = "L'épisode a été supprimée avec succès."
    redirect_to episodes_url
  end

  def add_user_episode
    tv_show = @episode.tv_show
    if !tv_show.blank? && !current_user.tv_shows.include?(tv_show)
      UserTvShow.create!({:user => current_user, :tv_show => tv_show })
    end
    UserEpisode.create!({:user => current_user, :episode => @episode })
    flash[:success] = "L'épisode a été ajouté à votre compte avec succès."
    redirect_back(fallback_location: episodes_url)
  end

  def remove_user_episode
    UserEpisode.destroy_all(user: current_user, episode: @episode)
    flash[:danger] = "L'épisode a été supprimé de votre compte avec succès."
    redirect_back(fallback_location: episodes_url)
  end

  private

  def set_episode
    @episode = Episode.find(params[:id])
  end

  def episode_params
    params.require(:episode).permit(:season, :episode, :title, :tv_show_id)
  end
end
