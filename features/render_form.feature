Feature: Rendering form

  Scenario: Render linear equation form
    Given a user visit home page
    When he clicks linear equation button
    Then he should see new linear equation form

  Scenario: Render quadratic equation form
    Given a user visit home page
    When he clicks quadratic equation button
    Then he should see new quadratic equation form