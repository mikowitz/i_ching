class CastHexagramScreen < PM::Screen
  attr_accessor :casting_method
  stylesheet CastHexagramScreenStylesheet

  def will_appear
    mp self.casting_method
    draw_hexagram
  end

  def draw_hexagram
    API.cast(self.casting_method) do |result|
      mp result
      rmq(self.view).apply_style(:root_view).tap do |q|
        q.append!(HexagramView).tap do |q_h|
          rmq(q_h).style do |st|
            st.frame = { centered: :horizontal }
          end
          q_h.lines = result["lines"].map { |line|
            case line
            when 6, 8 then "0"
            when 7, 9 then "1"
            end
          }
          q_h.draw_lines
        end
      end
    end
  end
end
