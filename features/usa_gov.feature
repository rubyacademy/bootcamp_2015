Feature: USA gov home page

  Background:
    Given I am on the USA.gov home page

  Scenario: Search section exists
     Then I see a search field

  Scenario: Search field value
    Then the search field value is "Search the Government..."

  Scenario: Search button exists
    Then I see a search button

  Scenario: Search button value
    Then the search button label is "Search"

  Scenario: Enter search
    When I submit a search "health"
    Then I see "at least 1" search result(s)

  Scenario: Enter search - special characters
    When I submit a search "h@$%^&*)(?/"
    Then I see "at least 1" search result(s)

  Scenario: Enter search - more than 50 characters - results
    When I submit a search "This.statement.can.have.50.characters.but.not....51"
    Then I see "0" search result(s)

  Scenario: Enter search - max 20 results per page
    When I submit a search "tax"
    Then I see "20" search result(s)

  Scenario Outline: Search
    When I submit a search "<search_string>"
    Then I see "<expected_results>" search result(s)
  Examples:
    | scenario                                         | search_string                                       | expected_results |
    | Enter search                                     | health                                              | at least 1       |
    | Enter search - special characters                | h@$%^&*)(?/                                         | at least 1       |
    | Enter search - more than 50 characters - results | This.statement.can.have.50.characters.but.not....51 | 0                |
    | max 20 results per page                          | tax                                                 | 20               |

  Scenario: Search 0 results
    When I submit a search "This.statement.can.have.50.characters.but.not...."
    Then a "no results found" message displays
  
  Scenario: Enter search - more than 50 characters - truncation
    When I submit a search "This.statement.can.have.50.characters.but.not....51"
    Then I see the search term truncated to 50 characters


##failing scenarios

  Scenario Outline: Failed Search
    When I submit a search "<search_string>"
    Then I see "<expected_results>" search result(s)
  Examples:
    | scenario                                         | search_string                                       | expected_results |
    | Enter search                                     | health                                              | 0                |
    | Enter search - special characters                | h@$%^&*)(?/                                         | 0                |
    | Enter search - more than 50 characters - results | This.statement.can.have.50.characters.but.not....51 | 1                |
    | max 20 results per page                          | tax                                                 | 19               |

  Scenario: Failed Enter search - more than 50 characters - truncation
    When I submit a search "This.statement.can.have.50.characters.but.not....51"
    Then I see the search term truncated to 51 characters

  Scenario: Failed Search section exists
    Then I see a search field
    And the field value is "Se1arch the Government..."
    And I see a search button
    And the button label is "Sea1rch"