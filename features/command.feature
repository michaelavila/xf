Feature: xf <command>

  Background:
    Given I successfully run `xf init`

  Scenario: executable file at project root
    Given a file named "mycommand" with:
      """
      echo "ran my command"
      """
    And I successfully run `chmod +x mycommand`
    When I successfully run `xf mycommand`
    Then the output should contain exactly "ran my command\n"

  Scenario: executable file not at project root
    Given a directory named "mydirectory"
    And a file named "mydirectory/mycommand" with:
      """
      echo "ran my command"
      """
    And I successfully run `chmod +x mydirectory/mycommand`
    When I successfully run `xf mycommand`
    Then the output should contain exactly "ran my command\n"

  Scenario: select from multiple executable files with same name
    Given a directory named "mydirectory"
    And a file named "mydirectory/mycommand" with:
      """
      echo "ran my command in my directory"
      """
    And a file named "mycommand" with:
      """
      echo "ran my command"
      """
    And I successfully run `chmod +x mydirectory/mycommand mycommand`
    When I run `xf mycommand` interactively
    And I wait for output to contain "./mycommand"
    And I wait for output to contain "./mydirectory/mycommand"
    And I type "2"
    Then the output should contain "ran my command in my directory"
