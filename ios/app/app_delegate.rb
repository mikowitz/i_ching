class AppDelegate < PM::Delegate
  include CDQ
  status_bar true, animation: :fade

  # Without this, settings in StandardAppearance will not be correctly applied
  # Remove this if you aren't using StandardAppearance
  ApplicationStylesheet.new(nil).application_setup

  def on_load(app, options)
    cdq.setup
    load_data
    true
  end

  def load_data
    Seeder.import_hexagrams
    cdq.save
    open HexagramTableScreen.new(nav_bar: true)
  end

  def self.load_seed_file(filename)
    YAML.load(File.read("#{NSBundle.mainBundle.resourcePath}/seeds/#{filename}.yml"))
  end

  # Remove this if you are only supporting portrait
  def application(application, willChangeStatusBarOrientation: new_orientation, duration: duration)
    # Manually set RMQ's orientation before the device is actually oriented
    # So that we can do stuff like style views before the rotation begins
    device.orientation = new_orientation
  end
end
