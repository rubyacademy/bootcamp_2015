Feature: USA gov home page

  Scenario: Search field exists
    Given I am on the USA.gov home page
    Then I see a search field

  Scenario: Search field value
    Given I am on the USA.gov home page
    Then the search field value is "Search the Government..."

  Scenario: Search button exists
    Given I am on the USA.gov home page
    Then I see a search button

  Scenario: Search button value
    Given I am on the USA.gov home page
    Then the search button label is "Search"

  Scenario: Enter search
    Given I am on the USA.gov home page
    When I submit a search "health"
    Then I see "at least 1" search result(s)

  Scenario: Enter search - special characters
    Given I am on the USA.gov home page
    When I submit a search "h@$%^&*)(?/"
    Then I see "at least 1" search result(s)

  Scenario: Enter search - more than 50 characters - results
    Given I am on the USA.gov home page
    When I submit a search "This.statement.can.have.50.characters.but.not....51"
    Then I see "0" search result(s)

  Scenario: Enter search - max 20 results per page
    Given I am on the USA.gov home page
    When I submit a search "tax"
    Then I see "20" search result(s)

  Scenario: Search 0 results
    Given I am on the USA.gov home page
    When I submit a search "This.statement.can.have.50.characters.but.not...."
    Then a "no results found" message displays
