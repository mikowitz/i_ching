class HexagramView < UIView
  attr_accessor :lines

  def rmq_build
    rmq(self).tap do |q|
      q.apply_style(:hexagram_view)
    end
  end

  def draw_lines
    rmq(self).tap do |q|
      lines.reverse.each_with_index do |line, index|
        case line.to_i
        when 0, 8
          q.append!(UIView, :hexagram_line).style do |st|
            dim = q.frame.size.width / 24
            st.frame = { t: dim * ((4 * index) + 1), w: dim * 8 }
          end
          q.append!(UIView, :hexagram_line).style do |st|
            dim = q.frame.size.width / 24
            st.frame = { t: dim * ((4 * index) + 1), w: dim * 8, fr: dim }
          end
        when 1, 7
          q.append!(UIView, :hexagram_line).style do |st|
            dim = q.frame.size.width / 24
            st.frame = { t: dim * ((4 * index) + 1) }
          end
        when 6
          q.append!(UIView, :hexagram_line).style do |st|
            dim = q.frame.size.width / 24
            st.frame = { t: dim * ((4 * index) + 1), w: dim * 8 }
            st.background_color = rmq.color.changing_line
          end
          q.append!(UIView, :hexagram_line).style do |st|
            dim = q.frame.size.width / 24
            st.frame = { t: dim * ((4 * index) + 1), w: dim * 8, fr: dim }
            st.background_color = rmq.color.changing_line
          end
        when 9
          q.append!(UIView, :hexagram_line).style do |st|
            dim = q.frame.size.width / 24
            st.frame = { t: dim * ((4 * index) + 1) }
            st.background_color = rmq.color.changing_line
          end
        end
      end
    end
  end
end
