class SongsController < ApplicationController
  before_action :set_artist, only: [:index, :create, :destroy]

    def index
      @songs = @artist.songs
    end

    def show
      @song = Song.find(params[:id])
    end

    def create
      @song = @artist.songs.new(song_params)
      if @song.save
        redirect_to @artist, notice: "Song Added"
      else
        redirect_to @artist, notice: "Please add a song"
      end
    end

    def destroy
        @song = @artist.songs.find(params[:id])
        @song.destroy
        redirect_to @artist, notice: "Song deleted!"
    end


    private

    def set_artist
       @artist = Artist.find(params[:artist_id])
     end


    def song_params
      params.require(:song).permit(:titel, :artist_id)
    end


end
