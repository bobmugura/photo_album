require 'net/http'

users_uri = URI('http://jsonplaceholder.typicode.com/users')
users_response = Net::HTTP.get(users_uri)
users = JSON.parse(users_response)

albums_uri = URI('http://jsonplaceholder.typicode.com/albums')
albums_response = Net::HTTP.get(albums_uri)
albums = JSON.parse(albums_response)

photos_uri = URI('http://jsonplaceholder.typicode.com/photos')
photos_response = Net::HTTP.get(photos_uri)
photos = JSON.parse(photos_response)

ActiveRecord::Base.transaction do
  users.each do |user|
    User.create!(name: user["name"], username: user["username"],
      email: user["email"], address_attributes: {street: user["address"]["street"],
      suite: user["address"]["suite"],city: user["address"]["city"],
      zipcode: user["address"]["zipcode"]}, phone: user["phone"],
      website: user["website"])
  end
  albums.each do |album|
    user = User.find(album["userId"])
    Album.create!(user: user, title: album["title"])
  end
  photos.each do |photo|
    album = Album.find(photo["albumId"])
    Photo.create!(album: album, title: photo["title"], url: photo["url"],
      thumbnail_url: photo["thumbnailUrl"])
  end
end

puts "Created #{User.count} users"
puts "Created #{Album.count} albums"
puts "Created #{Photo.count} photos"
