class HexagramScreenStylesheet < ApplicationStylesheet
  def root_view(st)
    st.background_color = color.white
  end

  def title(st)
    st.frame = { t: 60, w: screen_width, h: 50, l: 0 }
    st.text_alignment = :center
    st.font = font.small
  end

  def hexagram_view(st)
    w = (4 * device_width) / 5
    dim = (w / 24).to_i
    st.frame = { w: dim * 24, h: dim * 24, fr: 10, t: 120 }
  end

  def hexagram_line(st)
    dim = st.superview.frame.size.height / 24
    st.frame = { w: dim * 22, h: dim * 2, l: dim }
    st.background_color = color.black
    st.corner_radius = 6
  end

  def content_switcher(st)
    st.frame = { fb: 200, w: 200, centered: :horizontal, h: 20 }
  end

  def scroll_view(st)
    st.background_color = color.blue
    st.frame = { w: screen_width, h: 180, fb: 0 }
    st.content_offset = CGPointMake(0, 0)
    st.content_inset = UIEdgeInsetsMake(0, 0, 0, 0)
  end

  def image(st)
    st.number_of_lines = 0
    st.frame = { t: 20, w: 300, centered: :horizontal }
    st.font = font.tiny
  end
end
