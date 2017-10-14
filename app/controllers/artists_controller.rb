class ArtistsController < ApplicationController

  def show; end

  def index
     @artist = Artist.all
  end

  private

  def image_params
  params[:images].present? ? params.require(:images) : []
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




#def set_event
#  @event = Event.find(params[:id])
#end

#def event_params
#  params
#    .require(:event)
#    .permit(
#         :name,:description, :location, :price, :capacity, :includes_food,
#         :includes_drinks, :starts_at, :ends_at, :active, theme_ids: []
#    )
    #theme_ids is and array because an event can have many themes
#end


 #This symbol is called :images because it is defined in the photos.rb. via the ImageUploader
