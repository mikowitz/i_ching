require "sequel"

require "i_ching/has_attributes"
require "i_ching/hexagram"
require "i_ching/line"
require "i_ching/trigram"
require "i_ching/version"

module IChing
  # Your code goes here...
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
