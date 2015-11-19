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

  describe "#change" do
    let(:hexagram) { CastHexagram.new(6,7,8,9,8,7) }

    it "changes all old lines to their complementary young lines" do
      expect(hexagram.change.lines).to eq [7, 7, 8, 8, 8, 7]
    end
  end

  describe "#stabilize" do
    let(:hexagram) { CastHexagram.new(6,7,8,9,8,7) }

    it "changes all old lines to their paired young lines" do
      expect(hexagram.stabilize.lines).to eq [8, 7, 8, 7, 8, 7]
    end
  end

  describe "#binary" do
    let(:hexagram) { CastHexagram.new(6,7,8,9,8,7) }

    it "returns a binary value for the hexagram based on lines from bottom to top" do
      expect(hexagram.binary).to eq 21
    end
  end

  describe "#hexagram" do
    let(:hexagram) { CastHexagram.new(6,7,8,9,8,7) }

    it "returns the hexagram model for the stabilized version of the cast hexagram" do
      expect(hexagram.hexagram.king_wen_number).to eq 64
    end
  end
end
