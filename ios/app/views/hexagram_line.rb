class HexagramLine < UIView
  # attr_accessor :number, :changing
  attr_accessor :line, :dim, :index, :hexagram_view, :delegate

  def initialize(line, dim, index)
    @line = line
    @dim = dim
    @index = index
    @place = 6 - index
    initWithFrame(frame)
  end

  def frame
    x = dim
    y = dim * ((4 * index) + 1)
    h = dim * 2
    w = dim * 22
    CGRectMake(x, y, w, h)
  end

  def rmq_build
    rmq(self).tap do |q|
      q.apply_style(:hexagram_line)
    end.on(:tap) do
      if [6,9].include?(@line)
        self.delegate.show_line_alert(changing_line_header, changing_line_copy)
      end
    end
  end

  def changing_line_header
    "#{line_name} #{ordinal}"
  end

  def line_name
    case @line
    when 6 then "Six"
    when 9 then "Nine"
    else nil
    end
  end

  def ordinal
    case @place
    when 1 then "at the beginning"
    when 2 then "in the second place"
    when 3 then "in the third place"
    when 4 then "in the fourth place"
    when 5 then "in the fifth place"
    when 6 then "at the top"
    end
  end

  def changing_line_copy
    self.hexagram_view.hexagram.lines.where(place: @place).first.meaning
  end

  def draw_line_segments
    case line
    when 0, 8
      draw_broken_segment
    when 1, 7
      draw_single_segment
    when 6
      draw_broken_segment(rmq.color.changing_line)
    when 9
      draw_single_segment(rmq.color.changing_line)
    end
  end

  def draw_single_segment(color=rmq.color.off_black)
    rmq(self).tap do |q|
      q.append!(UIView, :hexagram_line_segment).style do |st|
        st.frame = st.superview.bounds
        st.background_color = color
      end
    end
  end

  def draw_broken_segment(color=rmq.color.off_black)
    rmq(self).tap do |q|
      q.append!(UIView, :hexagram_line_segment).style do |st|
        st.frame = st.superview.bounds
        st.frame = { w: dim * 8 }
        st.background_color = color
      end
      q.append!(UIView, :hexagram_line_segment).style do |st|
        st.frame = st.superview.bounds
        st.frame = { w: dim * 8, fr: 0 }
        st.background_color = color
      end
    end
  end
end
