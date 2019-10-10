require 'nokogiri'
require 'open-uri'

def page
	return page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
end

#je récupère les villes
def townhall(page)
  townhall = page.xpath("//a[@class='lientxt']/text()")
  return townhall
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
def get_townhall_email()
  i=0
  table = get_townhall_urls(page)
  townhall_email = []
  while i < table.length
    page2 = Nokogiri::HTML(open(table[i]))# ouverture d'une nouvelle page pour chaque élément du tableau
    townhall_email << page2.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]/text()")
    i += 1
  end
  return townhall_email
end


def make_hashe()# je créé un hash alimentant un tableau
  i = 0
  email = get_townhall_email()
  nom_ville = townhall(page)
  tableau_ville_mail = []
  
  while i < get_townhall_email.length
    nouveau_hash = Hash.new()
    nouveau_hash[tableau_ville_mail[i].text] = email[i].text
    tableau_ville_mail << nouveau_hash
    i += 1
  end
  return tableau_ville_mail
end

puts make_hashe()
#townhall_url
#get_townhall_urls(page)
#puts get_townhall_email()
#puts make_hashe()
#puts townhall(page)