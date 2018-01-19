require 'rubygems'
require 'nokogiri'
require 'open-uri'

#Route de la mairie

  def get_the_email_of_a_townhall_from_its_webpage(ville)
    ville = ville.to_s
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/#{ville}.html"))
    email = page.css('td[class=style27] p:contains("@")').text
    print email
  end
  #get_the_email_of_a_townhall_from_its_webpage("vaureal")



  def get_all_the_urls_of_val_doise_townhalls()
    page2 = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    listurl_brut = page2.css('.Style20 a')                #permet d'obtenir tout le code brut après le <a>
    listurl = listurl_brut.map{ |link| link['href']  }    #permet d'obtenir la valeur du href
    urls = listurl.each{ |lien| puts "http://annuaire-des-mairies.com"+ lien.slice!(1..lien.length)}
    #compile pour chaque résulat le début de l'url avec les fins d'url obtenues
    #le slice permet de retirer le "." au début de chaque fin d'url
  end
  #get_all_the_urls_of_val_doise_townhalls()






  def get_name_of_val_doise_townhalls()
    page2 = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    listname_brut = page2.css('.Style20 a').map { |name_brut| name_brut.text  }
    print listname_brut
  end

  listeville = get_name_of_val_doise_townhalls()
  listesite = get_all_the_urls_of_val_doise_townhalls()

#Hash non focntionnel
=begin
  remix = Hash[listeville.zip(listesite)]
  puts remix
=end
