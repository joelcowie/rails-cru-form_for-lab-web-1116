class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    find_song
 	  @genre = Genre.find(params[:id])
    @artist = Artist.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_params(:name))
    redirect_to song_path(@song)
  end

  def edit
    find_song
  end

  def update
    find_song
    @song.update(song_params(:name))
    redirect_to song_path(@song)
  end

  private

  def find_song
    @song = Song.find(params[:id])
  end

  def song_params(*args)
    params.require(:song).permit(*args)
  end
end
