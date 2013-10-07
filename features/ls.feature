Feature: xf ls

  Background:
    Given I successfully run `xf init`

  Scenario: executable file at project root
    Given an empty file named "mycommand"
    And I successfully run `chmod +x mycommand`
    When I successfully run `xf ls`
    Then the output should contain "./mycommand"

  Scenario: executable file not at project root
    Given a directory named "mydirectory"
    And an empty file named "mydirectory/mycommand"
    And I successfully run `chmod +x mydirectory/mycommand`
    When I successfully run `xf ls`
    Then the output should contain "./mydirectory/mycommand"

  Scenario: select from multiple executable files with same name
    Given a directory named "mydirectory"
    And an empty file named "mydirectory/mycommand"
    And an empty file named "mycommand"
    And I run `chmod +x mydirectory/mycommand mycommand`
    When I run `xf mycommand` interactively
    Then I wait for output to contain "Multiple matches found:" 
    And I wait for output to contain "./mycommand"
    And I wait for output to contain "./mydirectory/mycommand"
