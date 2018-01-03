require "HTTParty"
require "Nokogiri"
require "JSON"
require "Pry"
require "csv"

page = HTTParty.get("https://websta.me/n/sodanotpop")

Pry.start(binding)
