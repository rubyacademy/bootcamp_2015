Feature: USA gov home page

  Background:
    Given I am on the USA.gov home page

  Scenario: Search section exists
    Then I see a search field
    And the field value is "Search the Government..."
    And I see a search button
    And the button label is "Search"

  Scenario Outline: Search
    When I submit a search "<search_string>"
    Then I see "<expected_results>" search result(s)
  Examples:
    | scenario                                         | search_string                                       | expected_results |
    | Enter search                                     | health                                              | at least 1       |
    | Enter search - special characters                | h@$%^&*)(?/                                         | at least 1       |
    | Enter search - more than 50 characters - results | This.statement.can.have.50.characters.but.not....51 | 0                |
    | max 20 results per page                          | tax                                                 | 20               |

