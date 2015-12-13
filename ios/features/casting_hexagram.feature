Feature: Casting a hexagram
  Scenario: Opting to cast a hexagram
    Given I start the app
    And I touch "Cast Hexagram"
    Then the screen should match "cast hexagram menu"

  Scenario: Casting a hexagram
    Given I start the app
    And I cast a hexagram
    Then the screen should match "cast hexagram screen"

  Scenario: Paging left through cast results
    Given I start the app
    And I cast a hexagram
    And I page left
    Then the screen should match "stabilized cast"

  Scenario: Paging right through cast results
    Given I start the app
    And I touch "Cast Hexagram"
    And I touch "Yarrow"
    And I page right
    Then the screen should match "changed cast"
