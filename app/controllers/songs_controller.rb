class SongsController < ApplicationController
  before_action :find_artist, only: [:index, :new, :create]
  before_action :find_song, only: [:show, :edit, :update]

  def index
    @songs = @artist.songs.order(:title)
  end

  def new
    @song = @artist.songs.new
  end

  def create
    @song = @artist.songs.create(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @song.update(song_params)

    redirect_to @song
  end

  private

  def song_params
    params.require(:song).permit(:title)
  end

  def find_artist
    @artist = Artist.find(params[:artist_id])
  end

  def find_song
    @song = Song.find(params[:id])
  end
end
