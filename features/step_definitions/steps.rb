Given(/^I open the "(.*?)" browser$/) do |browser|
  @browser_opened = Watir::Browser.new HelperMethods.to_browser_id(browser)
end

Then(/^the "(.*?)" browser is open$/) do |browser|
  fail ("The #{browser} browser is not open.") unless HelperMethods.to_browser_id(browser) == @browser_opened.name
  @browser_opened.close
end

Given /^I am on the USA.gov home page$/ do
  BROWSER.goto 'www.usa.gov'
end

Then /^I see a search field$/ do
  fail ('The search field was not visible.') unless BROWSER.text_field(:id => "query").visible?
end

Then /^the field value is "([^"]*)"$/ do |search_string|
  actual =  BROWSER.text_field(:id => "query").placeholder
  unless search_string == actual
    fail ("The search field value #{actual } does not match the expected value #{ search_string }.")
  end
end

Then /^I see a search button$/ do
  fail ("The search button was not present.") unless BROWSER.button(:id => "buscarSubmit").present?
end

Then /^the button label is "([^"]*)"$/ do |button_label|
  actual =  BROWSER.button(:id => "buscarSubmit").text
  unless button_label  == actual
    fail ("The search button label #{actual} does not match the expected value #{ button_label }.")
  end
end

When(/^I submit a search "(.*?)"$/) do |search_string|
  BROWSER.text_field(:id => "query").set search_string
  BROWSER.button(:id => "buscarSubmit").click
end

Then(/^I see "(.*?)" search result\(s\)$/) do |expected_count|
# parse expected count
    parse_count = expected_count.to_s.match(/(\d*)([a-z|A-Z ]*)(\d*)/)
    compare_to = parse_count[2].strip
    count = parse_count[1] == '' ? parse_count[3].to_i : parse_count[1].to_i

# get the number of results
    result_count = BROWSER.divs(:id => /^result-/).size

# determine if step passes 
    comparison = case compare_to
                 when '', /equal/
                   count == result_count
                 when 'less than'
                   result_count < count
                 when 'greater than'
                   result_count > count
                 when 'or less'
                   result_count <= count
                 when 'or more', 'at least'
                   result_count >= count
                 else
                   fail ("Comparison #{compare_to} not supported")
                 end

    fail("The actual count #{result_count} does not match the expected count #{expected_count}.") unless comparison
end
