module IChing
  class Line
    include HasAttributes
    has_attributes :king_wen_number, :place, :meaning

    class << self
      def get(king_wen_number, place)
        new(table[king_wen_number: king_wen_number, place: place])
      end

      private

      def table
        IChing::DB.lines
      end
    end
  end
end
