class HexagramTableScreen < PM::TableScreen
  stylesheet HexagramTableScreenStylesheet
  title "Hexagrams"

  def table_cell_style
    {
      background_color: rmq.color.off_white,
      text_color: rmq.color.off_black
    }
  end

  def table_data
    [{
       cells: [
         {
           title: "Cast Hexagram",
           action: :show_cast_hexagram_menu,
           style: table_cell_style.merge(text_alignment: NSTextAlignmentRight)
         }
       ]
     },
     {
       cells: Hexagram.sort_by(:king_wen_number).map do |hexagram|
         {
           title: hexagram.chinese_name,
           subtitle: hexagram.english_name,
           action: :show_hexagram,
           arguments: {
             hexagram: hexagram
           },
           style: table_cell_style
         }
       end
     }
    ]
  end

  def show_hexagram(args)
    open HexagramScreen.new(hexagram: args[:hexagram])
  end

  def show_cast_hexagram_menu
    presentViewController(cast_hexagram_menu.alert_controller, animated: true, completion: nil)
  end

  def cast_hexagram_menu
    @cast_hexagram_menu ||= CastHexagramMenu.new.tap do |menu|
      menu.delegate = self
    end
  end

  def cast_hexagram(method)
    open CastingRootScreen.new(casting_method: method)
  end
end
