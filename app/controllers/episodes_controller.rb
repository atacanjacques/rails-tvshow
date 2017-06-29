class EpisodesController < ApplicationController
  before_action :set_episode, only: [:show, :edit, :update, :destroy, :add_user_episode,:remove_user_episode]

  def index
    # @episodes = Episode.all
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

    respond_to do |format|
      if @episode.save
        format.html { redirect_to @episode, notice: 'L\'épisode a été ajouter avec succès.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @episode.update(episode_params)
        format.html { redirect_to @episode, notice: 'L\'épisode a été modifier avec succès.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @episode.destroy
    respond_to do |format|
      format.html { redirect_to episodes_url, notice: 'L\'épisode a été supprimer avec succès.' }
    end
  end

  def my_episodes
    @my_episodes = UserEpisode.where(user_id: current_user)
    .paginate(page: params[:page], per_page: 5)

    @episodes = Episode.all
  end

  def add_user_episode
    UserEpisode.create!({:user => current_user, :episode => @episode })
    respond_to do |format|
      format.html { redirect_to episodes_url, notice: 'La série a été ajoutée à votre compte avec succès.' }
    end
  end

  def remove_user_episode
    user_episode = UserEpisode.where({:user => current_user, :episode => @episode }).first
    user_episode.destroy

    respond_to do |format|
      format.html { redirect_to episodes_url, notice: 'La série a été retirée de votre compte avec succès.' }
    end
  end

  private
  def set_episode
    @episode = Episode.find(params[:id])
  end

  def episode_params
    params.require(:episode).permit(:season, :episode, :title, :TvShow_id)
  end
end
