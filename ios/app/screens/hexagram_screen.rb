class HexagramScreen < PM::Screen
  stylesheet HexagramScreenStylesheet
  attr_accessor :hexagram

  def on_load
    self.title = hexagram["chinese_name"]
    rmq(self.view).apply_style(:root_view)

    rmq(self.view).tap do |q|
      q.append!(HexagramTextView).tap do |text_view|
        text_view.delegate = self
        text_view.draw_text
      end
      q.append!(UILabel, :title).style do |st|
        st.text = hexagram["english_name"].split(/\s[\(\[]/)[0]
      end
      q.append!(HexagramView).tap do |hv|
        hv.lines = hexagram["binary"].to_s(2).rjust(6, "0").split("")
        hv.draw_lines
      end
    end
  end
end
