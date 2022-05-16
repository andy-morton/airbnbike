# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'nokogiri'
require 'faker'
require 'open-uri'

def wait
  5.times do
    print('.')
    sleep(0.1)
  end
end

user_list = []

puts 'Deleting current Bikes'
wait
Bike.destroy_all
puts 'Bikes destroyed'

puts 'Deleting current Users'
wait
User.destroy_all
puts 'Users destroyed'

puts 'Creating users'
User.create(first_name: 'Shenty', last_name: 'Charles', email: 'demo@test.com', password: 'password')
10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  User.create(first_name: first_name, last_name: last_name, email: "#{first_name}@test.com", password: 'password')
  user_list << User.last.id
  puts "#{first_name} #{last_name} has signed up"
end
wait
puts 'All users seeded'

url = 'https://www.gumtree.com/bicycles/london'

html_file = URI.open(url).read
puts '1 no issue'
html_doc = Nokogiri::HTML(html_file)
puts '2 no issue'
puts html_doc.css(".listing-link")[0]['href']
html_doc.css(".listing-link").take(10).each do |link|
  bike_link = link['href']
  url2 = "https://www.gumtree.com#{bike_link}"
  puts url2
  html_file2 = URI.open(url2).read
  puts '3 no issue'
  html_doc2 = Nokogiri::HTML(html_file2)
  title = html_doc2.at("h1").text
  puts title
  description = html_doc2.at("[@itemprop = 'description']").text
  puts description
  price = html_doc2.at("[@itemprop = 'price']")['content']
  puts price
  location = html_doc2.at("[@itemprop = 'addressLocality']").text
  puts location
  photo_link = html_doc2.css(".carousel-item").css("img")[0]['src']
  puts photo_link
  user = User.find(user_list.sample)
  size = ['Children', 'Small', 'Medium', 'Large', 'X-Large'].sample
  category = ['Mountain', 'Road', 'Hybrid', 'Electric', 'Vintage'].sample
  Bike.create!(user: user, name: title, description: description, location: location, price: price, size:size, category: category )
  file = URI.open(photo_link)
  Bike.last.photos.attach(io: file, filename: 'my bike.png', content_type: 'image/png')
  puts "#{title} created"
end

wait
puts "Bikes seeded"
