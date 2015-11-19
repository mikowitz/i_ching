module IChing
  module Casters
    class Coins < Base

      private

      def generate_line
        3.times.map { rand(2) + 2 }.inject(0) { |t, n| t + n }
      end
    end
  end
end
