require 'open-uri'
require 'nokogiri'

url = "https://sao-paulo.restorando.com.br/restaurantes"

doc = Nokogiri::HTML(open(url).read)

doc.search('.restaurant').each do |box|
  name = box.search('h4 a').text
  address = box.search('.info-column a').first.text.strip
  rating = box.search('.stars .full').text.size
  image = box.search('.restaurant-image img').first.attributes['src'].value

  r = Restaurant.new
  r.name = name
  r.address = address
  r.rating = rating
  r.image = image
  r.save
end
