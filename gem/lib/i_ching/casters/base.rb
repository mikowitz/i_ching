module IChing
  module Casters
    class Base
      def cast_hexagram
        CastHexagram.new(*generate_lines)
      end

      def generate_lines
        6.times.map { generate_line }
      end

      def generate_line
        raise NotImplementedError
      end
    end
  end
end
