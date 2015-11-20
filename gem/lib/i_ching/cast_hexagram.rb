module IChing
  class CastHexagram
    class InvalidCast < ArgumentError; end

    CHANGES = {
      6 => 7,
      9 => 8
    }

    STABILIZATIONS = {
      6 => 8,
      9 => 7
    }

    BINARY = {
      7 => 1,
      8 => 0
    }

    attr_reader :lines

    def initialize(*lines)
      @lines = lines
      validate
    end

    def change
      CastHexagram.new(*lines.map { |line| CHANGES.fetch(line, line) })
    end

    def stabilize
      CastHexagram.new(*lines.map { |line| STABILIZATIONS.fetch(line, line) })
    end

    def binary
      stabilize.lines.map { |line| BINARY[line] }.join("").to_i(2)
    end

    def hexagram
      Hexagram.get_by_binary(self.binary)
    end

    def changed_hexagram
      change.hexagram
    end

    private

    def validate
      raise InvalidCast unless @lines.count == 6
      raise InvalidCast unless @lines.all? { |line| line.between?(6, 9) }
    end
  end
end
