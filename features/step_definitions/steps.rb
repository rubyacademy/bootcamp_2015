Given(/^I open the "(.*?)" browser$/) do |browser|
  @browser_opened = Watir::Browser.new HelperMethods.to_browser_id(browser)
end

Then(/^the "(.*?)" browser is open$/) do |browser|
  browser_name = @browser_opened.name
  @browser_opened.close
  expect(browser_name).to eq(HelperMethods.to_browser_id(browser))
end

Given /^I am on the USA.gov home page$/ do
  BROWSER.goto 'www.usa.gov'
end

Then /^I see a search field$/ do
  expect(BROWSER.text_field(:id => "query")).to be_visible
end

Then /^the search field value is "([^"]*)"$/ do |search_string|
  actual =  BROWSER.text_field(:id => "query").placeholder
  expect(actual).to eq(search_string)
end

Then /^I see a search button$/ do
  expect(BROWSER.button(:id => "buscarSubmit")).to be_present
end

Then /^the search button label is "([^"]*)"$/ do |button_label|
  actual =  BROWSER.button(:id => "buscarSubmit").text
  expect(actual).to eq(button_label)
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

  expect(comparison).to be_truthy
end

Then /^a "([^"]*)" message displays$/ do |message|
  actual = BROWSER.div(:id => 'no-results').text

  fail("The message #{actual} does not contain the text #{message}") unless actual =~ /#{message}/
end

Then /^I see the search term truncated to (\d+) characters$/ do |character_number|
  expected = character_number.to_i
  # get search string from edit field
  actual = BROWSER.text_field(:id => "query").value.size
  expect(actual).to eq(expected)
end
