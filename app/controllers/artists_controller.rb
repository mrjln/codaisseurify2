class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :update]

  def index
     @artists = Artist.all
  end

  def show
     @artists = Artist.all
     @songs = @artist.songs
  end

  def update
    respond_to do |format|
       if @artist.build(artist_params)
         format.html { redirect_to @artist, notice: 'Artist was successfully updated.' }
       else
         render :edit
       end
     end
   end

   def destroy
     set_artist
     @artist.destroy
     redirect_to artists_path
   end

  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
      params
     .permit(:name, :biography, :hometown, :songs)
   end
#
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
