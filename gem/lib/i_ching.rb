require "sequel"
require "json"

require "i_ching/has_attributes"
require "i_ching/cast_hexagram"
require "i_ching/caster"
require "i_ching/casters/base"
require "i_ching/casters/coins"
require "i_ching/casters/random"
require "i_ching/casters/yarrow"
require "i_ching/hexagram"
require "i_ching/line"
require "i_ching/trigram"
require "i_ching/version"

module IChing
  extend self

  def cast_hexagram(method=:yarrow)
    caster = IChing::Caster.with_method(method)
    caster.cast_hexagram
  end

  module DB
    extend self

    def database
      @database ||= Sequel.connect "sqlite://#{File.dirname(__FILE__)}/i_ching.db"
    end

    def hexagrams
      @hexagrams ||= database[:hexagrams]
    end

    def trigrams
      @trigrams ||= database[:trigrams]
    end

    def lines
      @lines ||= database[:lines]
    end
  end
end
