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
end
