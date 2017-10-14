class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show]

  def index
     @artists = Artist.all
     @photos = @artist.photos
  end

  def show
     @artists = Artist.all
     @songs = @artist.songs
  end

  def create
   @artist = artists.build(artist_params)

   if @artist.save
      flash[:notice] = "artist created"
      redirect_to @artist
   else
     render :new
   end
 end


  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

end





#  def set_artist
#    @artist = Artist.find(params[:id])
#  end

#  def artist_params
#    params
#   .permit(:name, :biography, :hometown, :images [])
#  end

#  def image_params
#    params[:images].present? ? params.require(:images) : []
#  end




#def set_artist
#  @artist = artist.find(params[:id])
#end

#def artist_params
#  params
#    .require(:artist)
#    .permit(
#         :name,:description, :location, :price, :capacity, :includes_food,
#         :includes_drinks, :starts_at, :ends_at, :active, theme_ids: []
#    )
    #theme_ids is and array because an artist can have many themes
#end


 #This symbol is called :images because it is defined in the photos.rb. via the ImageUploader
