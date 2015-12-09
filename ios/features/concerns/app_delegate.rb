class AppDelegate
  def load_data
    SDStatusBarManager.sharedInstance.enableOverrides
    SDStatusBarManager.sharedInstance.timeString = "04:01 AM"

    API.hexagrams do |hexagrams|
      Turnkey.archive(hexagrams, "hexagrams")
      open HexagramTableScreen.new(nav_bar: true)
    end
  end
end
