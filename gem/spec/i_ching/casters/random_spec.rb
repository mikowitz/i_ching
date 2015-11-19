require "spec_helper"

describe IChing::Casters::Random do
  describe "#cast_hexagram" do
    it "should return a valid CastHexagram" do
      100.times do
        expect(Casters::Random.new.cast_hexagram).to be_a CastHexagram
      end
    end
  end
end
