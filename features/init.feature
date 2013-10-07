Feature: xf init

  Scenario: without specifying a path
    When I successfully run `xf init`
    Then a file named ".xf" should exist

  Scenario: specifying a path
    Given a directory named "myproject"
    When I successfully run `xf init myproject`
    Then a file named "myproject/.xf" should exist
