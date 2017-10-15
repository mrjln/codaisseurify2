require 'rails_helper'

RSpec.describe Song, type: :model do
  describe "validations" do
    it "is invalid without a titel" do
      song = Song.new(titel: "")
      song.valid?
      expect(song.errors).to have_key(:titel)
    end
  end

#One more validation test of the model with shoulda-matchers. Does the same as above.
  describe "validations" do
    it { is_expected.to validate_presence_of(:titel) }
  end

#Test for association
  describe "association with Artist" do
    let(:artist) { create :artist }

    it "belongs to an Artist" do
      song = artist.songs.build(titel: "My Heart Will Go On")
      expect(song.artist).to eq(artist)
    end
  end
end
