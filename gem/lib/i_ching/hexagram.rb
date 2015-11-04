module IChing
  class Hexagram
    include HasAttributes
    has_attributes :english_name, :chinese_name, :king_wen_number, :characters, :judgement, :image

    class << self
      def get(king_wen_number)
        new(table[king_wen_number: king_wen_number])
      end

      private

      def table
        IChing::DB.hexagrams
      end
    end
  end
end
