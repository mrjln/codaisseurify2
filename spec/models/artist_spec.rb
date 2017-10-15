require 'rails_helper'

RSpec.describe Artist, type: :model do
    describe "validations" do
      it "is invalid without a name" do
      artist = Artist.new(name: "")
      artist.valid?
      expect(artist.errors).to have_key(:name)
    end
  end

#rspec model test with shouda-matcher format
  describe "validations" do
    it { is_expected.to validate_presence_of(:biography) }
  end

#test associations with songs
  describe "association with songs" do
    let(:artist) { create :artist}
    let!(:song) { create :song, artist: artist }

    it "has many songs" do
    song1 = artist.songs.new(titel: "Wonderful")
    song2 = artist.songs.new(titel: "Extraordinary")

    expect(artist.songs).to include(song1)
    expect(artist.songs).to include(song2)
  end
end




end
