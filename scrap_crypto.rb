require 'rubygems'
require 'nokogiri'
require 'open-uri'

#Trader de l'obscur

def get_currency_list()
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  currencies = page.css('a[class=currency-name-container]').map{|crypto| crypto.text}
  #permet d'obtenir la liste des monnaies *

  rates = page.css("a[class=price]").map{|crypto| crypto.text}
  #permet d'obtenir le cours de chaque monnaie

  currencies_rates = Hash[currencies.zip(rates)]
  #Associe à chaque monnaie sa valeur sous forme de arrays 
  puts currencies_rates
end

get_currency_list()
