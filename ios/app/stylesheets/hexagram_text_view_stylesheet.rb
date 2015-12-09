module HexagramTextViewStylesheet
  def hexagram_text_content(st)
    st.frame = { w: screen_width, h: screen_height / 3, fb: 0, l: 0 }
    st.background_color = color.clear
  end

  def hexagram_text_content_switcher(st)
    st.frame = { t: 10, w: screen_width - 60, centered: :horizontal, h: 30 }
    st.tint_color = color.black
  end

  def scroll_view(st)
    st.background_color = color.clear
    st.frame = { w: screen_width, h: st.superview.frame.size.height - 50, fb: 0 }
    st.content_offset = CGPointMake(0, 0)
    st.content_inset = UIEdgeInsetsMake(0, 0, 0, 0)
  end

  def hexagram_text(st)
    st.number_of_lines = 0
    st.frame = { t: 20, w: screen_width - 40, centered: :horizontal }
    st.font = font.tiny
  end
end
