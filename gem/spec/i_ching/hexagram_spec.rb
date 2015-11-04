require "spec_helper"

describe Hexagram do
  describe ".get" do
    it "should return the correct hexagram" do
      expect(Hexagram.get(1).english_name).to eq "The Creative"
    end
  end
end
