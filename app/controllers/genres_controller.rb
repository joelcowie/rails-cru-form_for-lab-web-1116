class GenresController < ApplicationController

  def show
    find_genre
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.create(genre_params(:name))
    redirect_to genre_path(@genre)
  end

  def edit
    find_genre
  end

  def update
    find_genre
    @genre.update(genre_params(:name))
    redirect_to genre_path(@genre)
  end

  private

  def find_genre
    @genre = Genre.find(params[:id])
  end

  def genre_params(*args)
    params.require(:genre).permit(*args)
  end

end
