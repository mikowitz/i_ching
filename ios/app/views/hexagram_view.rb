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
        if line == "0"
          q.append!(UIView, :hexagram_line).style do |st|
            dim = q.frame.size.width / 24
            st.frame = { t: dim * ((4 * index) + 1), w: dim * 8 }
          end
          q.append!(UIView, :hexagram_line).style do |st|
            dim = q.frame.size.width / 24
            st.frame = { t: dim * ((4 * index) + 1), w: dim * 8, fr: dim }
          end
        else
          q.append!(UIView, :hexagram_line).style do |st|
            dim = q.frame.size.width / 24
            st.frame = { t: dim * ((4 * index) + 1) }
          end
        end
      end
    end
  end
end
