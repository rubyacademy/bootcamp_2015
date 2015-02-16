module HelperMethods
  module Methods

    #launch a browser instance
    def launch_browser
      ENV['browser'] ||= 'firefox'

      Watir::Browser.new to_browser_id(ENV['browser'])
    end

    #Convert user names for browser to strings for watir-webdriver
    def to_browser_id(browser)
      case browser.downcase
        when 'internet explorer', 'ie'
          browser_name = 'internet_explorer'
        when /phantom/
          browser_name = 'phantomjs'
        else
          browser_name = browser.downcase
      end
    end

  end

  # make Methods instance methods in objects that include HelperMethods
  include self::Methods
  # make Methods available directly as HelperMethods.<method>
  self.extend(Methods)
  # make Methods class methods of classes that include HelperMethods
  def self.included(base)
    base.extend(Methods)
  end


end
