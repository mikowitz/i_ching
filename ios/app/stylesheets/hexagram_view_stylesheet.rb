module HexagramViewStylesheet
  def hexagram_view(st)
    w = (4 * device_width) / 5
    dim = (w / 24).to_i
    st.frame = { w: dim * 24, h: dim * 24, fr: 10, t: 120 }
  end

  def hexagram_line(st)
    dim = st.superview.frame.size.height / 24
    st.frame = { w: dim * 22, h: dim * 2, l: dim }
    st.background_color = color.off_black
    st.corner_radius = 6
  end
end
