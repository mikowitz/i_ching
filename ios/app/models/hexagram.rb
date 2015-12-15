class Hexagram < CDQManagedObject
  def self.find(king_wen_number)
    Hexagram.where(king_wen_number: king_wen_number).first
  end

  def self.load

  end
end
