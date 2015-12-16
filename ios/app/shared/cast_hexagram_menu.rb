class CastHexagramMenu
  attr_accessor :alert_controller, :delegate

  def initialize
    build_alert_controller
    alert_controller.addAction(action("Yarrow"))
    alert_controller.addAction(action("Coins"))
    alert_controller.addAction(action("Random"))
    alert_controller.addAction(cancel_action)
  end

  def build_alert_controller
    @alert_controller = UIAlertController.alertControllerWithTitle(
      "Choose casting method",
      message: nil,
      preferredStyle: UIAlertControllerStyleActionSheet
    )
  end

  def action(title)
    UIAlertAction.actionWithTitle(
      title,
      style: UIAlertActionStyleDefault,
      handler: -> (_) { cast_hexagram(title.downcase.to_sym) }
    )
  end

  def cancel_action
    cancel = UIAlertAction.actionWithTitle(
      "Cancel",
      style: UIAlertActionStyleCancel,
      handler: nil
    )
  end

  def cast_hexagram(method)
    delegate.cast_hexagram(method)
  end
end
