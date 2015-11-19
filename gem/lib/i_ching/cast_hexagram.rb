module IChing
  class CastHexagram
    class InvalidCast < ArgumentError; end

    def initialize(*lines)
      @lines = lines
      validate
    end

    private

    def validate
      raise InvalidCast unless @lines.count == 6
      raise InvalidCast unless @lines.all? { |line| line.between?(6, 9) }
    end
  end
end
