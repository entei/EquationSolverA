Feature: Solve the linear equation

  Scenario Outline: Successful linear equation solve
    Given user visit new linear equation page
    When user entered params <a> and <b>
    And user click 'Solve'
    Then he should see result <answer>

  Examples:
    |  a  |  b  | answer |
    |  2  |  4  | -2     |
    |  1  |  0  | -0     |
    |  1  |  -1 | 1      |
    |  -1 |  0  | 0      |
    | -1  | -1  | -1     |
    |  0  |  0  | Divide by zero! |
    |  0  | -1  | Divide by zero! |
    |  0  |  1  | Divide by zero! |

  Scenario: Unsuccessful linear equation solve
    Given user visit new linear equation page
    When user entered invalid params
    And user click 'Solve'
    Then he should see an error message