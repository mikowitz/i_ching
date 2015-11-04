require "spec_helper"

describe Line do
  context "class methods" do
    describe ".get" do
      let!(:line) { Line.get(2, 3) }

      it "returns the correct line" do
        expect(line.meaning).to match /^Hidden lines./
        expect(line.meaning).to match /but bring to completion.$/
      end
    end
  end
end
