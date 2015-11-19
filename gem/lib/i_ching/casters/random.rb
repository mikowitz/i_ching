module IChing
  module Casters
    class Random < Base

      private

      def generate_line
        rand(4) + 6
      end
    end
  end
end
