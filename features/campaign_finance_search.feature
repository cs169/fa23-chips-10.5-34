Feature: Campaign Finance Search
  As a user
  I want to search for candidate finance data
  So that I can view information about top candidates in a specific financial category for a given campaign cycle

  Scenario: Search for candidate finance data
    Given I visit the campaign finances page
    When I select "2020" from "cycle"
    And I select "Contribution Total" from "category"
    And I press "Search"
    Then I visit the campaign finances search page