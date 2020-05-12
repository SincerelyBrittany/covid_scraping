require_relative "covid19CDC/version"

require 'nokogiri'
require 'open-uri'
require 'HTTParty'
require 'net/http'
require 'json'
require 'pry'
require 'watir'

require_relative "./cli"
require_relative "./api_manager"
#require_relative "./cdc_scraper"

module Covid19CDC
  class Error < StandardError; end
  # Your code goes here...
end
