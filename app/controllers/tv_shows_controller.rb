class TvShowsController < ApplicationController
  before_action :set_tv_show, only: [:show, :edit, :update, :destroy]

  def index
    # @tv_shows = TvShow.all
    @tv_shows = TvShow.paginate(page: params[:page], per_page: 5)
  end

  def show
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

  private
  def set_tv_show
    @tv_show = TvShow.find(params[:id])
  end

  def tv_show_params
    params.require(:tv_show).permit(:nom, :statut, :duree, :channel_id)
  end
end
