Feature: Interacting with the map

  As an informed citizen
  So that I can see all of the representatives of my state or others
  I want to use the map to see all of the representatives of a given location

Scenario: I want to see all counties in a state
  Given I am on the homepage
  When I click on the state California
  When I click Counties in California
  Then I should see 58 counties