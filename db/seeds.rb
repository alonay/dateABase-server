# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

alona = Person.create(name: "Liam", ig: "sodanotpop", fit: 5)
interested = Char.create(name: "interested?")
input = PersonChar.create(input: "Yeah she is!", char: interested, person_id: 1)
gen = Person.create(name: "Will", ig: "w1nevitable", fit: 5)
age = Char.create(name: "age")

Person.all.each do |person| #iterate through people
  doc = Nokogiri::HTML(open("https://websta.me/n/#{person.ig}")) #get HTML
  i = 0
  doc.css(".list-img img").each do |node| #iterate through each image on feed
    break if i == 11 #stop after 20 images
    Photo.create(person: person, url: node.attribute("src").value) #create photo objects for each photo, set up relationship
    i += 1
  end
end
