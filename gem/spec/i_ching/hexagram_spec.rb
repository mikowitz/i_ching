require "spec_helper"

describe Hexagram do
  let!(:hexagram) { Hexagram.get(5) }

  context "class methods" do
    describe ".get" do
      it "returns the correct hexagram" do
        expect(hexagram.english_name).to eq "Waiting (Nourishment)"
      end
    end
  end

  context "instance methods" do
    describe "#line" do
      let!(:line) { hexagram.line(2) }

      it "returns the correct line" do
        expect(line.meaning).to match /^Waiting on the sand./
        expect(line.meaning).to match /The end brings good fortune.$/
      end
    end
  end
end
