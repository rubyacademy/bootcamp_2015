
Before('~@launch') do
  HelperMethods.suppress_warnings do
    BROWSER = HelperMethods.launch_browser
  end
end

After('~@launch') do
  BROWSER.close
end