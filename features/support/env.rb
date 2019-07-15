require "capybara"
require "capybara/cucumber"
require "os"
require "selenium-webdriver"
require_relative "helpers"

World(Helpers) #indica q todos o metodos do modulo Helpers são nativos

#Carregando arquivo de configuração de ambiente
CONFIG =  YAML.load_file(File.join(Dir.pwd, "features/support/config/#{ENV["ENV_TYPE"]}.yaml"))

case ENV["BROWSER"]
when "firefox"
  @drive = :selenium
when "chrome"
  @drive = :selenium_chrome
when "headless"
  @drive = :selenium_chrome_headless
else
  puts "Invalid Browser"
end

Capybara.configure do |config|
  config.default_driver = @drive
  config.app_host = CONFIG["url"]
  config.default_max_wait_time = 5
end
