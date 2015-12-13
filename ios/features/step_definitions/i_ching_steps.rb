Given /^I start the app$/ do
  # no-op
end

Given /^I cast a hexagram$/ do
  step %~I touch "Cast Hexagram"~
  step %~I touch "Yarrow"~
end

Given /^I page (.*)$/ do |direction|
  y = $driver.window_size.height - 5
  x = direction == "right" ? $driver.window_size.width - 10 : 10
  Appium::TouchAction.new.press(x: x, y: y, fingers: 1, tapCount: 1, duration: 0.5).perform
end
