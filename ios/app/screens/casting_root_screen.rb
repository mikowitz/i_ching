class CastingRootScreen < PM::Screen
  stylesheet CastingRootScreenStylesheet
  attr_accessor :casting_method, :cast_result, :page_view_screen

  def on_load
    API.cast(self.casting_method) do |result|
      self.cast_result = result
      self.page_view_screen = CastHexagramPageViewScreen.new.tap do |screen|
        screen.delegate = self
        screen.dataSource = self
      end
      page_view_screen.append
      self.title = controllers[1].hexagram.chinese_name
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

  def pageViewController(_, didFinishAnimating: finished, previousViewControllers: _, transitionCompleted: completed)
    if completed
      screen = controllers[rmq(:page_control).get.currentPage]
      self.title = screen.hexagram.chinese_name
    end
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
