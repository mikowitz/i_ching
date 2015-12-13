class CastingRootScreen < PM::Screen
  stylesheet CastingRootScreenStylesheet
  attr_accessor :casting_method, :cast_result

  def on_load
    rmq(self).apply_style(:root_view)
    API.cast(self.casting_method) do |result|
      self.cast_result = result
      cast_hexagram_page_view_screen = CastHexagramPageViewScreen.new.tap do |screen|
        screen.delegate = self
        screen.dataSource = self
      end
      cast_hexagram_page_view_screen.append
      rmq(UIPageControl).apply_style(:page_control)
    end
  end

  def controllers
    @controllers ||= [
      HexagramScreen.new(nav_bar: true, hexagram: Turnkey.unarchive("hexagrams").find{|h| h["king_wen_number"] == self.cast_result["stable"]}),
      CastHexagramScreen.new(nav_bar: true, cast_result: self.cast_result),
      HexagramScreen.new(nav_bar: true, hexagram: Turnkey.unarchive("hexagrams").find{|h| h["king_wen_number"] == self.cast_result["changed"]})
    ]
  end

  def pageViewController(_, viewControllerBeforeViewController: vc)
    index = controllers.index(vc)
    if index == 0
      nil
    else
      controllers[index-1]
    end
  end

  def pageViewController(_, viewControllerAfterViewController: vc)
    index = controllers.index(vc)
    if index == controllers.size - 1
      nil
    else
      controllers[index+1]
    end
  end

  def presentationCountForPageViewController(_)
    controllers.size
  end

  def presentationIndexForPageViewController(_)
    1
  end
end
