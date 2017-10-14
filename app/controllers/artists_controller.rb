class ArtistsController < ApplicationController
  def show
    @artist = Artist.find(params[:id])
  end
end


private

 def artist_params
   params
   .require(:artist)
   .permit(
     :name, :biography, :hometown
   )
 end
