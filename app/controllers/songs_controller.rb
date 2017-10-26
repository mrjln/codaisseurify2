class SongsController < ApplicationController
  before_action :set_artist, only: [:index, :show, :create, :destroy]

    def index
      @songs = @artist.songs
      @song = Song.new
    end

    def show
      @song = Song.find(params[:id])
    end

    def create
        @song = Songs.new(song_params)

        if @song.save
            redirect_to artist_path(@artist), notice: 'Song Added with HTML'
        else
          redirect_to @artist, notice: 'You did not add a song'
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
