
Before('~@launch') do
  BROWSER = HelperMethods.launch_browser
end

After('~@launch') do
  BROWSER.close
end