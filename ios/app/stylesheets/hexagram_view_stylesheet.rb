module HexagramViewStylesheet
  def hexagram_view(st)
    w = (4 * device_width) / 5
    dim = (w / 24).to_i
    st.frame = { w: dim * 24, h: dim * 24, t: 110, centered: :horizontal }
  end

  def hexagram_line(st)
    st.background_color = color.clear
    st.corner_radius = 6
  end

  def hexagram_line_segment(st)
    st.corner_radius = 6
    st.background_color = color.off_black
  end
end
