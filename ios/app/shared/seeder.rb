module Seeder
  extend self

  def import_lines
    lines = load_seed_file("lines")
    lines.each do |king_wen_number, line_data|
      king_wen_number = king_wen_number.to_i
      hexagram = Hexagram.find(king_wen_number)
      next if hexagram.lines.count == 6
      mp "======> creating lines for #{hexagram.king_wen_number}"
      line_data.each do |place, meaning|
        place = place.to_i
        next if !!hexagram.lines.where(place: place).first
        mp "==========> creating line #{place}"
        Line.create(
          hexagram: hexagram,
          place: place,
          meaning: meaning
        )
      end
    end
  end

  def import_hexagrams
    hexagrams = load_seed_file("hexagrams")
    hexagrams.each do |hexagram|
      king_wen_number = hexagram["king_wen_number"].to_i
      next if !!Hexagram.where(king_wen_number: king_wen_number).first
      mp "======= creating => #{king_wen_number}"
      Hexagram.create(
        king_wen_number: king_wen_number,
        binary: hexagram["binary"].to_i,
        english_name: hexagram["english_name"],
        chinese_name: hexagram["chinese_name"],
        characters: hexagram["characters"],
        judgement: judgements[king_wen_number - 1],
        image: images[king_wen_number - 1]
      )
    end
  end

  def judgements
    @judgements ||= load_seed_file("judgements")["judgements"]
  end

  def images
    @images ||= load_seed_file("images")["images"]
  end

  def load_seed_file(filename)
    YAML.load(File.read("#{NSBundle.mainBundle.resourcePath}/seeds/#{filename}.yml"))
  end
end
