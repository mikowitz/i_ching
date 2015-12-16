class HexagramLineDelegate
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
