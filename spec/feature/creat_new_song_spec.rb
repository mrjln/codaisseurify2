require 'rails_helper'

  describe "Adding a song to an artist " do
  let!(:artist) { create :artist}

  feature 'Create new song', js: true do
    scenario 'add a new song' do
      # Point your browser towards the todo path
      visit "artists/#{artist.id}"

      # Enter description in the text field
      fill_in 'Enter title of song', with: 'THIS IS A NEW SONG MAN YES'

      # Press enter (to submit the form)
      page.execute_script("$('form').submit()")

      # Expect the new task to be displayed in the list of tasks
      expect(page).to have_content('THIS IS A NEW SONG MAN YES')
    end
  end
end
