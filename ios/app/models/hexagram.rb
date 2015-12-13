class Hexagram
  def self.find(king_wen_number)
    Turnkey.unarchive("hexagrams").
      find { |hexagram| hexagram["king_wen_number"] == king_wen_number }
  end
end
