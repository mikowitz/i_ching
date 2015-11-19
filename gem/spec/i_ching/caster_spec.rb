require "spec_helper"

describe Caster do
  describe ".with_method" do
    it "returns a caster when given a valid caster name" do
      expect(Caster.with_method(:yarrow)).to be_a Casters::Yarrow
    end

    it "raises an error when given an invalid caster name" do
      expect { Caster.with_method(:nope) }.to raise_error IChing::Caster::InvalidCaster
    end
  end
end
