class CastHexagramScreenStylesheet < ApplicationStylesheet
  include HexagramViewStylesheet

  def root_view(st)
    st.background_color = color.white
  end
end
