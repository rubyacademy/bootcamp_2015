  Feature: Getting Started

  Scenario: launch internet explorer
    Given I open the "ie" browser
    Then the "ie" browser is open

  Scenario: launch chrome
    Given I open the "chrome" browser
    Then the "chrome" browser is open

  Scenario: launch firefox
    Given I open the "firefox" browser
    Then the "firefox" browser is open

  Scenario: launch phantomjs
    Given I open the "phantomjs" browser
    Then the "phantomjs" browser is open

  Scenario Outline: launch each
    Given I open the "<browser>" browser
    Then the "<browser>" browser is open
  Examples:
    | browser           |
    | Internet Explorer |
    | Firefox           |
    | PhantomJS         |
    | IE                |
    | chrome            |

  Scenario: launch internet explorer
    Given I am on the USA.gov home page
