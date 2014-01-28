Feature: Solve the quadratic equation

  Scenario Outline: Successful quadratic equation solve
    Given user visit new quadratic equation page
    When user entered params <a>, <b> and <c>
    And user click 'Solve'
    Then he should see result <x1> and <x2>

  Examples:
    |  a  |  b  |  c  |  x1  |  x2  |
    |  4  |  8  |  0  |  -2  |  0   |
    | -1  |  2  |  3  |  3   |  -1  |
    |  1  |  2  |  1  |  -1  |  -1  |

  Scenario: Unsuccessful quadratic equation solve
    Given user visit new quadratic equation page
    When user entered invalid quadric eqation params
    And user click 'Solve'
    Then he should see an error message