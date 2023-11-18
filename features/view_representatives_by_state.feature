Feature: display list of representatives for a given state

  As an informed citizen
  So that I can see all of the representatives of my state or others
  I want to see all of the representatives of a given state

Background: representatives have been added to database

  Given the following representatives exist:
  |Gavin Newsom            |
  |Alexander Ocasio Cortez |

  And Gavin Newsom has the following news articles:
  |title                                                                           |description                                                                            |link                                                                                                                                    |
  |Newsom Orders Second Shutdown of Restaurants and Indoor Businesses amid COVID-19|The new order affects 19 California counties with a surging number of coronavirus cases|https://people.com/human-interest/california-gov-gavin-newsom-orders-second-shutdown-of-restaurants-and-indoor-businesses-amid-covid-19/|
  ||||