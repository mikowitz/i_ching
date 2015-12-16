class CastHexagramScreenStylesheet < ApplicationStylesheet
  include HexagramViewStylesheet

  def root_view(st)
    st.background_color = color.off_white
  end

  def title(st)
    st.frame = { t: 60, w: screen_width, h: 50, l: 0 }
    st.text_alignment = :center
    st.color = color.off_black
    st.font = font.small
  end
end
