class HexagramTableScreen < PM::TableScreen
  title "Hexagrams"

  def table_data
    [{
       cells: Turnkey.unarchive("hexagrams").map do |hexagram|
         {
           title: hexagram["chinese_name"],
           subtitle: hexagram["english_name"],
           action: :show_hexagram,
           arguments: {
             hexagram: hexagram
           }
         }
       end
     }
    ]
  end

  def show_hexagram(args={})
    open HexagramScreen.new(hexagram: args[:hexagram])
  end
end
