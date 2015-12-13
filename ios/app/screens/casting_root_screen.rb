class CastingRootScreen < PM::Screen
  stylesheet CastingRootScreenStylesheet
  attr_accessor :casting_method, :cast_result

  def on_load
    # rmq(self).apply_style(:root_view)
    API.cast(self.casting_method) do |result|
      self.cast_result = result
      CastHexagramPageViewScreen.new.tap do |screen|
        screen.delegate = self
        screen.dataSource = self
      end.append
      rmq(UIPageControl).apply_style(:page_control)
    end
  end

  def controllers
    @controllers ||= [
      HexagramScreen.new(nav_bar: true, hexagram: Hexagram.find(self.cast_result["stable"])),
      CastHexagramScreen.new(nav_bar: true, cast_result: self.cast_result),
      HexagramScreen.new(nav_bar: true, hexagram: Hexagram.find(self.cast_result["changed"]))
    ]
  end

  def pageViewController(_, viewControllerBeforeViewController: vc)
    index = controller_index(vc)
    return nil if index == 0
    controllers[index-1]
  end

  def pageViewController(_, viewControllerAfterViewController: vc)
    index = controller_index(vc)
    return nil if index == controllers.size - 1
    controllers[index+1]
  end

  def presentationCountForPageViewController(_)
    controllers.size
  end

  def presentationIndexForPageViewController(_)
    1
  end

  private

  def controller_index(vc)
    controllers.index(vc)
  end
end
