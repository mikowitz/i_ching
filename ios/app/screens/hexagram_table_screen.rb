class HexagramTableScreen < PM::TableScreen
  stylesheet HexagramTableScreenStylesheet
  title "Hexagrams"

  def preferredStatusBarStyle
    UIStatusBarStyleLightContent
  end

  def table_data
    [{
       cells: [
         {
           title: "Cast Hexagram",
           action: :show_cast_hexagram_menu,
           style: {
             background_color: rmq.color.off_white,
             text_color: rmq.color.off_black,
             text_alignment: NSTextAlignmentRight
           }
         }
       ]
     },
     {
       cells: Turnkey.unarchive("hexagrams").map do |hexagram|
         {
           title: hexagram["chinese_name"],
           subtitle: hexagram["english_name"],
           action: :show_hexagram,
           arguments: {
             hexagram: hexagram
           },
           style: {
             background_color: rmq.color.off_white,
             text_color: rmq.color.off_black
           }
         }
       end
     }
    ]
  end

  def show_hexagram(args)
    open HexagramScreen.new(hexagram: args[:hexagram])
  end

  def show_cast_hexagram_menu
    menu = UIAlertController.alertControllerWithTitle("Choose casting method",
                                                      message: nil,
                                                      preferredStyle: UIAlertControllerStyleActionSheet)
    yarrow = UIAlertAction.actionWithTitle("Yarrow",
                                           style: UIAlertActionStyleDefault,
                                           handler: -> (_){ cast_hexagram(:yarrow) })
    menu.addAction(yarrow)
    coins = UIAlertAction.actionWithTitle("Coins",
                                           style: UIAlertActionStyleDefault,
                                           handler: -> (_){ cast_hexagram(:coins) })
    menu.addAction(coins)
    random = UIAlertAction.actionWithTitle("Random",
                                           style: UIAlertActionStyleDefault,
                                           handler: -> (_){ cast_hexagram(:random) })
    menu.addAction(random)
    cancel = UIAlertAction.actionWithTitle("Cancel",
                                           style: UIAlertActionStyleCancel,
                                           handler: nil)
    menu.addAction(cancel)
    presentViewController(menu, animated: true, completion: nil)
  end

  def cast_hexagram(method)
    open CastingRootScreen.new(casting_method: method)
  end
end
