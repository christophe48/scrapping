require 'nokogiri'
require 'open-uri'

Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
