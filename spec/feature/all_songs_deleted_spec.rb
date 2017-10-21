require 'rails_helper'

  describe "Deleting ALL song of the artist with Ajax" do
  let!(:artist) { create :artist}
  let!(:song) {create :song, artist: artist, titel: 'Holiday'}
  let!(:song) {create :song, artist: artist, titel: 'Ditiseensuperlangetitelvaneenliedje'}

  feature 'Delete ALL songs', js: true do
    scenario 'delete all songs from the artist' do
      visit "artists/#{artist.id}"
      page.execute_script("$('.deleteAllSongs').click()")

      expect(page).not_to eq('Holiday')
      expect(page).not_to eq('Ditiseensuperlangetitelvaneenliedje')
    end
  end
end
