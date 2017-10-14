class Artist < ApplicationRecord

  has_many :songs, dependent: :destroy
  has_many :photos, dependent: :destroy

def photos
  @photos = artist.photos
end
end
