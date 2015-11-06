module IChing
  class Trigram
    include HasAttributes
    has_attributes :english_name, :chinese_name, :number, :characters, :binary

    class << self
      def all
        table.map { |trigram_data| new(trigram_data) }
      end

      def get(number)
        new(table[number: number])
      end

      private

      def table
        IChing::DB.trigrams
      end
    end
  end
end
