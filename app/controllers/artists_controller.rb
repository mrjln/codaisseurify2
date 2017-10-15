class ArtistsController < ApplicationController

  def index
     @artists = Artist.all
  end

  def show
     @artists = Artist.all
     @artist = Artist.find(params[:id])
     @song = Song.new
  end

  def destroy
    set_artist
    @artist.destroy
    redirect_to artists_path, notice: "Artist Deleted"
  end

 private

  def set_artist
    @artist = Artist.find(params[:id])
  end
end
