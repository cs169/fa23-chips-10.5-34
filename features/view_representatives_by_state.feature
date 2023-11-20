# code by Genna Gams
Feature: display list of representatives for a given state

  As an informed citizen
  So that I can see all of the representatives of my state or others
  I want to see all of the representatives of a given state

Background: representatives have been added to database

  Given the following representatives exist:
  |name                     |
  |Gavin Newsom             |
  |Alexandria Ocasio Cortez |

  And we have the following news articles:
  |rep                     |title                                                                           |description                                                                                                                                                                                                                                                                                                                                             |link                                                                                                                                    |
  |Gavin Newsom            |Newsom Orders Second Shutdown of Restaurants and Indoor Businesses amid COVID-19|The new order affects 19 California counties with a surging number of coronavirus cases                                                                                                                                                                                                                                                                 |https://people.com/human-interest/california-gov-gavin-newsom-orders-second-shutdown-of-restaurants-and-indoor-businesses-amid-covid-19/|
  |Gavin Newsom            |Newsom warns that young adults are not 'invincible' to Coronavirus              |Gov. Gavin Newsom said Monday that the surge in coronavirus cases hitting California was due in part to younger people who might believe “they are invincible” but nonetheless are becoming sick from COVID-19.                                                                                                                                         |https://www.latimes.com/california/story/2020-07-06/young-adult-who-think-they-are-invincible-hit-hard-by-coronavirus-newsom-says       |
  |Alexandria Ocasio Cortez|What AOC and other House Dems want to do about Climate Change                   |A new select committee report is perfectly in tune with the growing climate policy alignment on the left around standards, investments, and justice.                                                                                                                                                                                                    |https://www.vox.com/energy-and-environment/2020/6/30/21305891/aoc-climate-change-house-democrats-select-committee-report|
  |Alexandria Ocasio Cortez|AOC among Dems who launch a fundraising campaign on a progressive platform      |Democratic Reps. Alexandria Ocasio-Cortez of New York, Ilhan Omar of Minnesota, Rashida Tlaib of Michigan and Ayanna Pressley of Massachusetts are launching a joint fundraising committee called the "Squad Victory Fund," the latest effort by the well-known freshmen lawmakers to support one another and their advocacy for progressive priorities.|https://www.cnn.com/2020/07/01/politics/squad-ocasio-cortez-tlaib-omar-pressley/index.html                              |
  |Alexandria Ocasio Cortez|AOC opts to skip debate citing social distancing rules                          |New York Rep. Alexandria Ocasio-Cortez insisted Monday she’s “not skipping debates” like her predecessor, Joe Crowley, did to disastrous effect two years ago — even though she is ducking one Wednesday citing social distancing rules despite having been out at a George Floyd protest and other group events this month.                            |https://nypost.com/2020/06/15/aoc-defends-decision-not-to-attend-wednesdays-debate-in-person/                           |


Scenario:
  When I go to the representatives page
  And I fill in "address" with "California"
  And I press "commit"
  Then there should be 1 entry for Gavin Newsom

  When I click on news articles for Gavin Newsom
  Then there should be 2 articles
  
  