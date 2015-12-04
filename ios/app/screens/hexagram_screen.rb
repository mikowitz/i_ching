class HexagramScreen < PM::Screen
  stylesheet HexagramScreenStylesheet
  attr_accessor :hexagram

  def on_load
    self.title = hexagram["chinese_name"]
    rmq(self.view).apply_style(:root_view)

    rmq(self.view).tap do |q|
      q.append(UIScrollView, :scroll_view).tap do |q_sv|
        q_sv.append(UILabel, :image)
      end
      q.append!(UISegmentedControl, :content_switcher).tap do |switcher|
        switcher.insertSegmentWithTitle("Image", atIndex: 0, animated: true)
        switcher.insertSegmentWithTitle("Judgement", atIndex: 1, animated: true)
        rmq(switcher).on(:change) { switcher_changed }
        switcher.selectedSegmentIndex = 0
      end
      q.append!(UILabel, :title).style do |st|
        st.text = hexagram["english_name"].split(/\s[\(\[]/)[0]
      end
      q.append!(UIView, :hexagram_view).tap do |q_h|
        lines = hexagram["binary"].to_s(2).rjust(6, "0").split("")
        lines.reverse.each_with_index do |line, index|
          if line == "0"
            q_h.append!(UIView, :hexagram_line).style do |st|
              dim = q_h.frame.size.width / 24
              st.frame = { t: dim * ((4 * index) + 1), w: dim * 8 }
            end
            q_h.append!(UIView, :hexagram_line).style do |st|
              dim = q_h.frame.size.width / 24
              st.frame = { t: dim * ((4 * index) + 1), w: dim * 8, fr: dim }
            end
          else
            q_h.append!(UIView, :hexagram_line).style do |st|
              dim = q_h.frame.size.width / 24
              st.frame = { t: dim * ((4 * index) + 1) }
            end
          end
        end
      end
    end
    switcher_changed
  end

  def switcher_changed
    rmq(:scroll_view).get.setContentOffset(CGPointMake(0, 0), animated: false)
    rmq(:scroll_view).get.setContentInset(UIEdgeInsetsMake(0, 0, 0, 0))
    case rmq(:content_switcher).get.selectedSegmentIndex
    when 0
      rmq(:image).style do |st|
        st.text = hexagram["image"]
        st.size_to_fit
        st.frame = { t: 20 }
      end
      rmq(:scroll_view).get.setContentOffset(CGPointMake(0, 0), animated: false)
      rmq(:scroll_view).get.setContentInset(UIEdgeInsetsMake(0, 0, 0, 0))
    when 1
      rmq(:image).style do |st|
        st.text = hexagram["judgement"]
        st.size_to_fit
        st.frame = { t: 20 }
      end
      rmq(:scroll_view).get.setContentOffset(CGPointMake(0, 0), animated: false)
      rmq(:scroll_view).get.setContentInset(UIEdgeInsetsMake(0, 0, 0, 0))
    end
    mp "SWITCHER_CHANGED"
    size = rmq(:image).frame.size
    size.height = size.height + 50
    rmq(:scroll_view).get.contentSize = size
    mp rmq(:scroll_view).get.contentOffset
    mp rmq(:scroll_view).get.contentInset
  end
end
