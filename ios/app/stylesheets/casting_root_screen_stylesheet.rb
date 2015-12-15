class CastingRootScreenStylesheet < ApplicationStylesheet
  def root_view(st)
    st.background_color = color.off_white
  end

  def page_control(st)
    st.frame = { fb: 100 }
  end

  def paginator(st)
  end
end
