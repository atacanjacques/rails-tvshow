class GenresController < ApplicationController
  before_action :set_genre, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
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

    if @genre.save
      flash[:success] = "Le genre a été ajoutée avec succès."
      redirect_to @genre
    else
      render :new
    end
  end

  def update
    if @genre.update(genre_params)
      flash[:success] = "Le genre a été modifiée avec succès."
      redirect_to @genre
    else
      render :edit
    end
  end

  def destroy
    @genre.destroy
    flash[:danger] = "Le genre a été supprimée avec succès."
    redirect_to genres_url
  end

  private

  def set_genre
    @genre = Genre.find(params[:id])
  end

  def genre_params
    params.require(:genre).permit(:name)
  end
end
