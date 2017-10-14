class ArtistsController < ApplicationController
  #before_action :set_artist

  def show
    @artist = Artist.find(params[:id])
  end
end

def index
   @artist = Artist.find(params[:id])
 end

 def create
    @artist = Artist.find(params[:id])
  end


private

#def set_artist
#   @artist = artist.find(params[:id])
 #end

 def artist_params
   params
   .require(:artist)
   .permit(
     :name, :biography, :hometown
   )
 end
