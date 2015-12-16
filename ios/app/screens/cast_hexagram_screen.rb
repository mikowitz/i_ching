class CastHexagramScreen < PM::Screen
  attr_accessor :cast_result, :hexagram
  stylesheet CastHexagramScreenStylesheet

  def will_appear
    self.hexagram = Hexagram.find(cast_result["stable"])
    draw_hexagram
  end

  def draw_hexagram
    rmq(self.view).apply_style(:root_view).tap do |q|
      q.append!(UILabel, :title).style do |st|
        st.text = hexagram.english_name.split(/\s[\(\[]/)[0]
      end
      q.append!(HexagramView).tap do |q_h|
        q_h.delegate = self
        q_h.hexagram = self.hexagram
        rmq(q_h).style do |st|
          st.frame = { centered: :horizontal }
        end
        q_h.lines = self.cast_result["lines"]
        q_h.draw_lines
      end
    end
  end

  def show_line_alert(title, message)
    alert = UIAlertController.alertControllerWithTitle(
      title,
      message: message,
      preferredStyle: UIAlertControllerStyleAlert
    )
    action = UIAlertAction.actionWithTitle(
      "OK",
      style: UIAlertActionStyleDefault,
      handler: nil
    )
    alert.addAction(action)
    presentViewController(alert, animated: true, completion: nil)
  end
end
