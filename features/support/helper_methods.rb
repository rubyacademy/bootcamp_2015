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
          :internet_explorer
        when /phantom/
          :phantomjs
        when /chrome/
          :chrome
        else
          :firefox
      end
    end

    def suppress_warnings
      #from http://mentalized.net/journal/2010/04/02/suppress-warnings-from-ruby/
      original_verbosity = $VERBOSE
      $VERBOSE = nil
      result = yield
      $VERBOSE = original_verbosity

      result
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
