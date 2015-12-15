class AppDelegate
  def load_data
    SDStatusBarManager.sharedInstance.enableOverrides
    SDStatusBarManager.sharedInstance.timeString = "04:01 AM"

    Seeder.import_hexagrams
    cdq.save
    open HexagramTableScreen.new(nav_bar: true)
  end
end
