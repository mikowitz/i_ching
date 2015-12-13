class CastHexagramScreen < PM::Screen
  attr_accessor :casting_method, :cast_result
  stylesheet CastHexagramScreenStylesheet

  def will_appear
    draw_hexagram
  end

  def draw_hexagram
    rmq(self.view).apply_style(:root_view).tap do |q|
      q.append!(HexagramView).tap do |q_h|
        rmq(q_h).style do |st|
          st.frame = { centered: :horizontal }
        end
        q_h.lines = self.cast_result["lines"]
        q_h.draw_lines
      end
    end
  end
end
