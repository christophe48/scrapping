require 'nokogiri'
require 'open-uri'

def page
	return page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
end

#je récupère les villes
def townhall(page)
townhall = page.xpath("//a[@class='lientxt']")
return townhall.text
end

#je récupère les URL par villes
def get_townhall_urls(page)
  url = page.xpath("//a[@class='lientxt']")

tableau = []

url.each do |townhall_url|
        tableau << "http://annuaire-des-mairies.com/" + townhall_url['href']
   end
   return tableau #je met tout les mail dans un tableau
end

#je récupère les mails des villes
def get_townhall_email(tableau)
  i=0
  while i<tableau.size
  Nokogiri::HTML(open(tableau[i]))
  townhall_email = page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]")
  i += 1
 end
return townhall_email
end

#townhall_url
#get_townhall_urls(page)
puts get_townhall_email(get_townhall_urls(page))
