require "spec_helper"

describe CastHexagram do
  describe "validation" do
    it "should raise an error if there are not 6 lines" do
      expect { CastHexagram.new(6,7,8,9) }.to raise_error IChing::CastHexagram::InvalidCast
      expect { CastHexagram.new(6,7,8,9,8,7,6) }.to raise_error IChing::CastHexagram::InvalidCast
    end

    it "should raise an error if any line falls outside the range [6-9]" do
      expect { CastHexagram.new(6,7,8,9,8,10) }.to raise_error IChing::CastHexagram::InvalidCast
      expect { CastHexagram.new(6,7,8,9,8,5) }.to raise_error IChing::CastHexagram::InvalidCast
    end

    it "should not raise an error when there are 6 lines in the range [6-9]" do
      expect(CastHexagram.new(6,7,8,9,8,7)).to be_a CastHexagram
    end
  end
end
