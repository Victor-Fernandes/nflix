require "capybara"
require "capybara/cucumber"
require "os"
require "selenium-webdriver"
require_relative "helpers"

World(Helpers) #indica q todos o metodos do modulo Helpers são nativos

#Carregando arquivo de configuração de ambiente
CONFIG =  YAML.load_file(File.join(Dir.pwd, "features/support/config/#{ENV["ENV_TYPE"]}.yaml"))

Capybara.configure do |config|
  config.default_driver = :selenium_chrome #usando o chrome pois o firefox não consegue encontrar o elemento 
  #para selecionar o status do filme
  #config.default_driver = :selenium
  config.app_host = CONFIG["url"]
  config.default_max_wait_time = 5
end
