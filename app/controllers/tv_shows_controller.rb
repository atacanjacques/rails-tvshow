class TvShowsController < ApplicationController
  before_action :set_tv_show, only: [:show, :edit, :update, :destroy, :add_user_tv_show, :remove_user_tv_show]

  def index
    # @tv_shows = TvShow.all
    @tv_shows = TvShow.paginate(page: params[:page], per_page: 5)
  end

  def show
    @episodes = Episode.where(tv_show_id: params[:id]).paginate(page: params[:page], per_page: 5)
  end

  def new
    @tv_show = TvShow.new
  end

  def edit
  end

  def create
    @tv_show = TvShow.new(tv_show_params)

    respond_to do |format|
      if @tv_show.save
        format.html { redirect_to @tv_show, notice: 'La série a été ajouter avec succès.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @tv_show.update(tv_show_params)
        format.html { redirect_to @tv_show, notice: 'La série a été modifier avec succès.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @tv_show.destroy
    respond_to do |format|
      format.html { redirect_to tv_shows_url, notice: 'La série a été supprimer avec succès.' }
    end
  end

  def my_tv_shows
    @my_tv_shows = UserTvShow.where(user_id: current_user)
    .paginate(page: params[:page], per_page: 5)

    @tv_shows = TvShow.all
  end

  def add_user_tv_show
    UserTvShow.create!({:user => current_user, :tv_show => @tv_show })
    respond_to do |format|
      format.html { redirect_to tv_shows_url, notice: 'La série a été ajoutée à votre compte avec succès.' }
    end
  end

  def remove_user_tv_show
    user_tv_show = UserTvShow.where({:user => current_user, :tv_show => @tv_show }).first
    user_tv_show.destroy

    respond_to do |format|
      format.html { redirect_to tv_shows_url, notice: 'La série a été retirée de votre compte avec succès.' }
    end
  end

  private
  def set_tv_show
    @tv_show = TvShow.find(params[:id])
  end

  def tv_show_params
    params.require(:tv_show).permit(:name, :status, :time, :channel_id, genre_ids: [])
  end
end
