  Feature: Getting Started

    @launch
  Scenario: launch internet explorer
    Given I open the "ie" browser
    Then the "ie" browser is open

    @launch
  Scenario: launch chrome
    Given I open the "chrome" browser
    Then the "chrome" browser is open

    @launch
  Scenario: launch firefox
    Given I open the "firefox" browser
    Then the "firefox" browser is open

    @launch
  Scenario: launch phantomjs
    Given I open the "phantomjs" browser
    Then the "phantomjs" browser is open

    @launch
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

  Scenario: open home page
    Given I am on the USA.gov home page
