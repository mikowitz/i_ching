Feature: Running the IChing app
  As a user
  I want to be able to user the app
  So that I can learn about my future

  Scenario: Hexagram table screen
    Given I start the app
    Then the screen should match "hexagram table screen"

  Scenario: Hexagram screen
    Given I start the app
    And I touch "Youthful Folly"
    Then the screen should match "hexagram screen"

  Scenario: Hexagram judgement
    Given I start the app
    And I touch "Youthful Folly"
    When I touch "Judgement"
    Then the screen should match "hexagram screen with judgement"


  Scenario: Opting to cast a hexagram
    Given I start the app
    And I touch "Cast Hexagram"
    Then the screen should match "cast hexagram menu"

  Scenario: Casting a hexagram
    Given I start the app
    And I touch "Cast Hexagram"
    And I touch "Yarrow"
    Then the screen should match "cast hexagram screen"
