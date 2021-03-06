require "spec_helper"

describe Hexagram do
  let!(:hexagram) { Hexagram.get(5) }

  context "class methods" do
    describe ".all" do
      it "returns all hexagrams" do
        expect(Hexagram.all.map(&:king_wen_number)).to eq (1..64).to_a
      end
    end

    describe ".get" do
      it "returns the correct hexagram" do
        expect(hexagram.english_name).to eq "Waiting (Nourishment)"
      end
    end
  end

  context "instance methods" do
    describe "#to_json" do
      let(:json) { hexagram.to_json }

      it "returns valid json" do
        expect(JSON.parse(json)["king_wen_number"]).to eq 5
      end
    end

    describe "#lines" do
      it "returns all lines for a hexagram" do
        expect(hexagram.lines.count).to eq 6
        expect(hexagram.lines.first.place).to eq 1
        expect(hexagram.lines.last.place).to eq 6
      end
    end

    describe "#line" do
      let!(:line) { hexagram.line(2) }

      it "returns the correct line" do
        expect(line.meaning).to match /^Waiting on the sand./
        expect(line.meaning).to match /The end brings good fortune.$/
      end
    end
  end
end
