
require 'rubygems'
require 'nokogiri'
require 'open-uri'

=begin
doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
doc.xpath('	//table[@class = "Style20"] /a').each do |node|
  puts node.text
end
=end


=begin  => FOntionnel !
def get_the_email_of_a_townhal_from_its_webpage(ville)
  ville = ville.to_s
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/#{ville}.html"))
  email = page.css('td[class=style27] p:contains("@")').text
  print email
end

get_the_email_of_a_townhal_from_its_webpage("vaureal")
=end

def get_all_the_urls_of_val_doise_townhalls()
  page2 = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
  listurl_brut = page2.css('.Style20 a') #permet d'obtenir tout le code brut après le <a>
  listurl = listurl_brut.map { |link| p link ['href']  }
  urls = listurl.each { |lien| puts "http://annuaire-des-mairies.com/"+lien[1,*] }

end
get_all_the_urls_of_val_doise_townhalls()
