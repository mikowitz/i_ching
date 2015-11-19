require "spec_helper"

describe IChing::Casters::Coins do
  describe "#cast_hexagram" do
    it "should return a valid CastHexagram" do
      100.times do
        expect(Casters::Coins.new.cast_hexagram).to be_a CastHexagram
      end
    end
  end
end
