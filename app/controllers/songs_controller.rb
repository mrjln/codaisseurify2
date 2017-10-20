class SongsController < ApplicationController
  before_action :set_artist, only: [:index, :show, :create, :destroy]

    def index
      @songs = @artist.songs
    end

    def show
      @song = Song.find(params[:id])
    end

    def create
        @song = @artist.songs.new(song_params)

        respond_to do |format|
        if @song.save
          format.html {redirect_to @artist, notice: "Song Added"}
          format.json {render :show, status :created, location: @song}
        else
          format.html {redirect_to @artist, notice: "You did not add a song"}
          format.json {render json: artist.errors, status: :unprocessable_entity}
        end
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
