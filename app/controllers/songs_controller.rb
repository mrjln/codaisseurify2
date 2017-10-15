class SongsController < ApplicationController

def index
  @songs = @artist.songs
end

def show
  @song = Song.find(params[:id])
end


end
