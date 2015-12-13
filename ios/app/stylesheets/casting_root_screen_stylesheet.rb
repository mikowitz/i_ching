class CastingRootScreenStylesheet < ApplicationStylesheet
  def root_view(st)
    st.background_color = color.off_white
  end

  def page_control(st)
    st.accessibility_label = "page-control"
  end

  def paginator(st)
  end
end
