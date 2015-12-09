class HexagramScreenStylesheet < ApplicationStylesheet
  include HexagramViewStylesheet
  include HexagramTextViewStylesheet

  def root_view(st)
    st.background_color = color.white
  end

  def title(st)
    st.frame = { t: 60, w: screen_width, h: 50, l: 0 }
    st.text_alignment = :center
    st.font = font.small
  end
end
