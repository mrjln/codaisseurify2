require 'rails_helper'

describe "Deleting a song of the artist with Ajax" do
let!(:artist) { create :artist}
let!(:song) {create :song, artist: artist, titel: 'Holiday'}

  feature 'song deleted', js: true do
    scenario 'delete a song' do
      visit "artists/#{artist.id}"
      page.execute_script("$('.deleteOneSong').click()")

      expect(page).not_to eq('Holiday')
    end
  end
end
