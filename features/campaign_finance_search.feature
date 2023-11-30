Feature: Campaign Finance Search
  As a user
  I want to search for candidate finance data
  So that I can view information about top candidates in a specific financial category for a given campaign cycle

  Scenario: Search for candidate finance data
    Given I am on the search page
    When I fill in "cycle" with "2020"
    And I select "Contribution Total" from "category"
    And I press "Search"
    Then I should see "Search results for 2020 cycle and Contribution Total"
    And I should see financial data for top candidates