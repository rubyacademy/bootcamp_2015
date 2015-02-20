Given(/^I open the "(.*?)" browser$/) do |browser|
  @browser_opened = Watir::Browser.new HelperMethods.to_browser_id(browser)
end

Then(/^the "(.*?)" browser is open$/) do |browser|
  fail ("The #{browser} browser is not open.") unless HelperMethods.to_browser_id(browser).to_sym == @browser_opened.name
end

Given /^I am on the USA.gov home page$/ do
  BROWSER.goto 'www.usa.gov'
end