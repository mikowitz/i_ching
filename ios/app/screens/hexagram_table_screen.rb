class HexagramTableScreen < PM::TableScreen
  title "Hexagrams"

  def table_data
    [{
       cells: Turnkey.unarchive("hexagrams").map do |hexagram|
         {
           title: hexagram["chinese_name"],
           subtitle: hexagram["english_name"]
         }
       end
     }
    ]
  end
end
