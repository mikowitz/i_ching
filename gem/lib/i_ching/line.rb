module IChing
  class Line
    include HasAttributes
    has_attributes :king_wen_number, :place, :meaning

    class << self
      def all(king_wen_number)
        table.where(king_wen_number: king_wen_number).order(:place).map { |line| new(line) }
      end

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
