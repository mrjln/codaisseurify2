class Song < ApplicationRecord

  belongs_to :artist

  validates :titel, presence: true
  #validates :year, presence: true

end
