require "spec_helper"

describe Trigram do
  context "class methods" do
    describe ".all" do
      it "returns all the trigrams" do
        expect(Trigram.all.map(&:number)).to eq (1..8).to_a
      end
    end

    describe ".get" do
      it "returns the correct trigram" do
        expect(Trigram.get(4).english_name).to eq "Keeping Still"
      end
    end
  end
end
