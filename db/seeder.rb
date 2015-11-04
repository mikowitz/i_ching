require "sequel"
require "yaml"

module Seeder
  extend self

  def db
    Sequel.connect "sqlite://i_ching.db"
  end

  def load_schema!
    db.create_table! :hexagrams do
      primary_key :id
      Integer :king_wen_number
      Integer :binary
      String :english_name
      String :chinese_name
      String :characters
      Text :judgement
      Text :image
    end

    db.create_table! :trigrams do
      primary_key :id
      Integer :number
      Integer :binary
      String :english_name
      String :chinese_name
      String :characters
    end

    db.create_table! :lines do
      primary_key :id
      Integer :king_wen_number
      Integer :place
      Text :meaning
    end
  end

  def insert_hexagrams!
    hexagram_table = db[:hexagrams]

    hexagrams = load_yaml_file("hexagrams")
    images = load_yaml_file("images")
    judgements = load_yaml_file("judgements")

    hexagrams.each do |hexagram_data|
      hexagram_data["judgement"] = judgements["judgements"][hexagram_data["king_wen_number"] - 1]
      hexagram_data["image"] = images["images"][hexagram_data["king_wen_number"] - 1]

      hexagram_table.insert(hexagram_data)
    end
  end

  def insert_trigrams!
    trigram_table = db[:trigrams]

    trigrams = load_yaml_file("trigrams")

    trigrams.each do |trigram_data|
      trigram_table.insert(trigram_data)
    end
  end

  def insert_lines!
    line_table = db[:lines]

    line_sets = YAML.load(File.open("./seeds/lines.yml"))

    line_sets.each do |(king_wen_number, lines)|
      lines.each do |(place, meaning)|
        line_table.insert(king_wen_number: king_wen_number, place: place, meaning: meaning)
      end
    end
  end

  def load_yaml_file(collection_name)
    YAML.load(File.open("./seeds/#{collection_name}.yml"))
  end
end

Seeder.load_schema!
Seeder.insert_hexagrams!
Seeder.insert_trigrams!
Seeder.insert_lines!
