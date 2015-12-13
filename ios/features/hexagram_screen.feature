Feature: The hexagram screen
  Scenario: Hexagram screen
    Given I start the app
    And I touch "Youthful Folly"
    Then the screen should match "hexagram screen"

  Scenario: Hexagram judgement
    Given I start the app
    And I touch "Youthful Folly"
    When I touch "Judgement"
    Then the screen should match "hexagram screen with judgement"
