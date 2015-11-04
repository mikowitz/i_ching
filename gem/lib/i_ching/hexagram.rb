module IChing
  class Hexagram
    include HasAttributes
    has_attributes :english_name, :chinese_name, :king_wen_number, :characters, :binary, :judgement, :image

    class << self
      def get(king_wen_number)
        new(table[king_wen_number: king_wen_number])
      end

      private

      def table
        IChing::DB.hexagrams
      end
    end

    def line(line_place)
      Line.get(self.king_wen_number, line_place)
    end
  end
end
