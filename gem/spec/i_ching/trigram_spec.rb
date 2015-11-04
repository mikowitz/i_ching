require "spec_helper"

describe Trigram do
  describe ".get" do
    it "returns the correct trigram" do
      expect(Trigram.get(4).english_name).to eq "Keeping Still"
    end
  end
end
