class HexagramTextView < UIView
  attr_accessor :delegate

  def rmq_build
    rmq(self).tap do |q|
      q.apply_style(:hexagram_text_content)
    end
  end

  def draw_text
    rmq(self).tap do |q|
      q.append!(UISegmentedControl, :hexagram_text_content_switcher).tap do |switcher|
        switcher.insertSegmentWithTitle("Image", atIndex: 0, animated: true)
        switcher.insertSegmentWithTitle("Judgement", atIndex: 1, animated: true)
        rmq(switcher).on(:change) { switcher_changed }
        switcher.selectedSegmentIndex = 0
      end
      q.append(UIScrollView, :scroll_view).tap do |scroll|
        scroll.append(UILabel, :hexagram_text).style do |st|
          st.text = self.delegate.hexagram["image"]
          st.font = rmq.font.tiny
          st.size_to_fit
          st.frame = { t: 20, centered: :horizontal }
        end
        scroll.get.contentSize = rmq(:hexagram_text).frame.size
      end
    end
  end

  def switcher_changed
    case rmq(:hexagram_text_content_switcher).get.selectedSegmentIndex
    when 0
      content = delegate.hexagram["image"]
    when 1
      content = delegate.hexagram["judgement"]
    end
    rmq(:hexagram_text).style do |st|
      st.text = content
      st.resize_height_to_fit
      st.frame = { t: 20, centered: :horizontal }
    end
    size = rmq(:hexagram_text).frame.size
    size.height = size.height + 30
    rmq(:scroll_view).get.contentSize = size
  end
end
