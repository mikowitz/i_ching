class HexagramView < UIView
  attr_accessor :lines, :hexagram, :delegate

  def rmq_build
    rmq(self).tap do |q|
      q.apply_style(:hexagram_view)
    end
  end

  def draw_lines
    rmq(self).tap do |q|
      lines.reverse.each_with_index do |line, index|
        dim = q.frame.size.width / 24
        q.append!(HexagramLine.new(line.to_i, dim, index)).tap do |hl|
          hl.delegate = self.delegate
          hl.hexagram_view = self
          hl.line = line.to_i
          hl.draw_line_segments
        end
      end
    end
  end
end
