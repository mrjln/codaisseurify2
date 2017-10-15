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
    it { is_expected.to validate_presence_of(:year) }
  end

  
end
