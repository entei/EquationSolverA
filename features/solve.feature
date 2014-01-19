Feature: Solve the equation
  
  Scenario: Successful solve
    Given user visit new equation page
    When user send valid params
    Then he shoul see result page

  Scenario: Unsuccessful solve
    Given user visit new equation page
    When user send invalid params
    Then he should see an error message