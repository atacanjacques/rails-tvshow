class GenresController < ApplicationController
  before_action :set_genre, only: [:show, :edit, :update, :destroy]

  def index
    # @genres = Genre.all
    @genres = Genre.paginate(page: params[:page], per_page: 5)
  end

  def show
  end

  def new
    @genre = Genre.new
  end

  def edit
  end

  def create
    @genre = Genre.new(genre_params)

    respond_to do |format|
      if @genre.save
        format.html { redirect_to @genre, notice: 'Le genre a été ajouter avec succès.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @genre.update(genre_params)
        format.html { redirect_to @genre, notice: 'Le genre a été modifier avec succès.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @genre.destroy
    respond_to do |format|
      format.html { redirect_to genres_url, notice: 'Le genre a été supprimer avec succès.' }
    end
  end

  private
    def set_genre
      @genre = Genre.find(params[:id])
    end

    def genre_params
      params.require(:genre).permit(:name)
    end
end
