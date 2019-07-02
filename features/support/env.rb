require "capybara"
require "capybara/cucumber"
require "selenium-webdriver"
require_relative "helpers"

World(Helpers) #indica q todos o metodos do modulo Helpers são nativos

Capybara.configure do |config|
  config.default_driver = :selenium
  config.app_host = "http://localhost:8080"
  config.default_max_wait_time = 5
end
