class Api::SongsController < ApplicationController

  def create
  @artist = Artist.find(params[:artist_id])
  @song = @artist.songs.build(song_params)
  @song.artist = @artist

    if @song.save
      render status: 201, json: @song
    else
      render status: 422, json: {
        errors: @song.errors
      }.to_json
    end
  end


  def destroy
    @song = Song.find(params[:id])

    if @song.destroy
      render status: 200, json: {
        message: "Song was deleted with ajax"
      }.to_json
      end
    end


  private

  def song_params
    params.require(:song).permit(:titel, :artist_id)
  end

end
