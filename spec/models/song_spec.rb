require 'rails_helper'

RSpec.describe Song, type: :model do
  describe "validations" do
    it "is invalid without a titel" do
      song = Song.new(titel: "")
      song.valid?
      expect(song.errors).to have_key(:titel)
    end
  end
end
