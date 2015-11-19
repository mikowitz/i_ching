module IChing
  module Casters
    class Yarrow < Base

      private

      def generate_line
        @remainder_sets = []
        @stalks = 50
        @remainder = 0

        put_single_stalk_aside

        3.times do
          divide_stalks
          take_one_stalk_from_right_hand_pile
          take_least_mod_four_from_left
          take_least_mod_four_from_right
          set_remainder_aside

          reset_stalks
        end

        convert_remainders_to_line
      end

      def put_single_stalk_aside
        @stalks -= 1
      end

      def divide_stalks
        @left = (@stalks / 2) + (rand(20) - 10)
        @right = @stalks - @left
      end

      def take_one_stalk_from_right_hand_pile
        @remainder += 1
        @right -= 1
      end

      def take_least_mod_four_from_left
        r = @left % 4
        r = case r
            when 0 then 4
            else r
            end
        @left -= r
        @remainder += r
      end

      def take_least_mod_four_from_right
        r = @right % 4
        r = case r
            when 0 then 4
            else r
            end
        @right -= r
        @remainder += r
      end

      def set_remainder_aside
        @remainder_sets << @remainder
      end

      def reset_stalks
        @remainder = 0
        @stalks = @left + @right
        @left = 0
        @right = 0
      end

      def convert_remainders_to_line
        @remainder_sets.map do |r|
          case r
          when 8, 9 then 2
          when 4, 5 then 3
          end
        end.inject(0) { |t, n| t + n }
      end
    end
  end
end
