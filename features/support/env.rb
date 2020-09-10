require 'rspec'
require 'capybara'
require 'site_prism'
require 'cucumber'
require 'selenium-webdrive'

Capybara.register_drive :site_prism do |app|
    Capybara::Selenium::Driver.new(app, browser: remote, :url => 'http://localhost:4444/wd/hub', :desired_capabilities => :chrome)
end

Capybara.configure do |config|
    config.run_server = false
    Capybara.default_driver = :site_prism
    Capybara.page.driver.browser.manage.window.maximize
    config.default_max_wait_time = 10
    config.app_host = 'https://www.automationpractice.com/index.php'
end
