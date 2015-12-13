class CastHexagramScreenStylesheet < ApplicationStylesheet
  include HexagramViewStylesheet

  def root_view(st)
    st.background_color = color.off_white
  end
end
