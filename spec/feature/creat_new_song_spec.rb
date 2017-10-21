require 'rails_helper'

  describe "Adding a song to an artist " do
  let!(:artist) { create :artist}

  feature 'Create new song', js: true do
    scenario 'add a new song' do

      visit "artists/#{artist.id}"
      fill_in 'New song title', with: 'THIS IS A NEW SONG MAN YES'
      page.execute_script("$('form').submit()")

      expect(page).to have_content('THIS IS A NEW SONG MAN YES')
    end
  end
end
