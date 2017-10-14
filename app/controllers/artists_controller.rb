class ArtistsController < ApplicationController
#  before_action :set_artist

  def show; end

  def index
     @artist = Artist.all
  end



  #def set_artist
  #  @artist = Artist.find(params[:id])
  #end

#  def artist_params
#    params
#    .permit(:name, :biography, :hometown)
#  end

end
