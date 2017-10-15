class Song < ApplicationRecord

  belongs_to :artist

  validates :titel presence: true

end
