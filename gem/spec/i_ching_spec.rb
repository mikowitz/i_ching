require "spec_helper"

describe IChing do
  describe ".cast_hexagram" do
    describe "with default method" do
      it "returns a cast hexagram" do
        expect(IChing.cast_hexagram).to be_a CastHexagram
      end
    end

    describe "with a valid casting method passed in" do
      it "returns a cast hexagram" do
        expect(IChing.cast_hexagram(:coins)).to be_a CastHexagram
      end
    end

    describe "with an invalid casting method passed in" do
      it "raises an error" do
        expect { IChing.cast_hexagram(:whatever) }.to raise_error IChing::Caster::InvalidCaster
      end
    end
  end
end
