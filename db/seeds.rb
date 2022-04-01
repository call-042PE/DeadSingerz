# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
Singer.destroy_all
User.destroy_all
Rating.destroy_all

user_1 = User.create!(first_name: "clement", last_name: "guidet", email: "c.guidet@lesang.com", password: "123456", password_confirmation: "123456")
user_2 = User.create!(first_name: "eric", last_name: "zarazir", email: "e.zarazir@lesang.com", password: "123456", password_confirmation: "123456")
user_3 = User.create!(first_name: "leandro", last_name: "barbosa", email: "l.barbosa@lesang.com", password: "123456", password_confirmation: "123456")
user_4 = User.create!(first_name: "thibault", last_name: "brianceau", email: "t.brianceau@lesang.com", password: "123456", password_confirmation: "123456")

img_category_1 = URI.open("https://res.cloudinary.com/ddkm6bg5l/image/upload/v1648550694/DeadSingerz/TupacShakur_dana-lixenberg_uhyuxo.jpg")
img_category_2 = URI.open("https://res.cloudinary.com/ddkm6bg5l/image/upload/v1648550735/DeadSingerz/jim-morrison-du-groupe-de-rock-the-doors_ag1uaa.jpg")
img_category_3 = URI.open("https://res.cloudinary.com/ddkm6bg5l/image/upload/v1648737651/DeadSingerz/jimi_pg911i.jpg")
img_category_4 = URI.open("https://res.cloudinary.com/ddkm6bg5l/image/upload/v1648737901/DeadSingerz/bob_irq2vw.jpg")
img_category_5 = URI.open("https://res.cloudinary.com/ddkm6bg5l/image/upload/v1648803909/DeadSingerz/kurt_tosv1e.jpg")
img_category_6 = URI.open("https://res.cloudinary.com/ddkm6bg5l/image/upload/v1648738053/DeadSingerz/lil_bie57r.webp")
img_category_7 = URI.open("https://res.cloudinary.com/ddkm6bg5l/image/upload/v1648738117/DeadSingerz/serge_fbhqkf.webp")
img_category_8 = URI.open("https://res.cloudinary.com/ddkm6bg5l/image/upload/v1648803987/DeadSingerz/janis_varxif.jpg")
img_category_9 = URI.open("https://res.cloudinary.com/ddkm6bg5l/image/upload/v1648551216/DeadSingerz/Johnny_fvmtdo.jpg")
img_category_10 = URI.open("https://res.cloudinary.com/ddkm6bg5l/image/upload/v1648551265/DeadSingerz/daniel-balavoine_qpcsqj.jpg")
img_category_11 = URI.open("https://res.cloudinary.com/ddkm6bg5l/image/upload/v1648804085/DeadSingerz/elvis_tj7len.webp")
img_category_12 = URI.open("https://res.cloudinary.com/ddkm6bg5l/image/upload/v1648551358/DeadSingerz/henri-salvador_n5aycf.jpg")

category_1 = Singer.create!(name: "2pac", category: "rap", price: 500, bio: "Considered one of the most influential rappers of all time, from new york east coast.", death_year: 1996, birth_year: 1971, user: user_1)
category_1.photo.attach(io: img_category_1, filename: '2Pac.png', content_type: 'image/png')

category_2 = Singer.create!(name: "Jim Morrison", category: "rock", price: 500, bio: "American singer, poet and songwriter who was the lead vocalist of the rock band the Doors.", death_year: 1971, birth_year: 1943, user: user_2)
category_2.photo.attach(io: img_category_2, filename: 'Jim_Morrison.png', content_type: 'image/png')

category_3 = Singer.create!(name: "Jimi Hendrix", category: "rock", price: 500, bio: "American musician, singer, and songwriter. Considered one of the most influential guitar Hero of all time.", death_year: 1970, birth_year: 1942, user: user_3)
category_3.photo.attach(io: img_category_3, filename: 'Jimi_Hendrix.png', content_type: 'img/png')

category_4 = Singer.create!(name: "Bob Marley", category: "reggae", price: 500, bio: "Jamaican singer, songwriter, and musician. Considered one of the pioneers of reggae.", death_year: 1981, birth_year: 1945, user: user_4)
category_4.photo.attach(io: img_category_4, filename: 'Bob_Marley.png', content_type: 'img/png')

category_5 = Singer.create!(name: "Kurt Cobain", category: "rock", price: 500, bio: "American singer, songwriter, artist and musician. He was the frontman of the rock band Nirvana.", death_year: 1994, birth_year: 1967, user: user_1)
category_5.photo.attach(io: img_category_5, filename: 'Kurt_Cobain.png', content_type: 'img/png')

category_6 = Singer.create!(name: "Lil Peep", category: "rap", price: 500, bio: "Swedish-American rapper, singer, and songwriter. He was a member of the emo rap collective GothBoiClique.", death_year: 2017, birth_year: 1996, user: user_2)
category_6.photo.attach(io: img_category_6, filename: 'Lil_Peep.png', content_type: 'img/jpg')

category_7 = Singer.create!(name: "Serge Gainsbourg", category: "pop", price: 500, bio: "French musician, singer-songwriter, actor, author and filmmaker. Regarded as one of the most important figures in French pop.", death_year: 1991, birth_year: 1928, user: user_3)
category_7.photo.attach(io: img_category_7, filename: 'Serge_Gainsbourg.png', content_type: 'img/png')

category_8 = Singer.create!(name: "Janis Joplin", category: "rock", price: 500, bio: "American singer-songwriter who sang rock, soul, and blues music. One of the most successful and widely known rock stars of her era.", death_year: 1970, birth_year: 1943, user: user_4)
category_8.photo.attach(io: img_category_8, filename: 'Janis_Joplin.png', content_type: 'img/png')

category_9 = Singer.create!(name: "Johnny Hallyday", category: "rock", price: 500, bio: "French rock and roll and pop singer and actor, credited for having brought rock and roll to France.", death_year: 2017, birth_year: 1943, user: user_3)
category_9.photo.attach(io: img_category_9, filename: 'Johnny_Halliday.png', content_type: 'img/png')

category_10 = Singer.create!(name: "Daniel Balavoine", category: "pop", price: 500, bio: " French singer and songwriter. He was hugely popular in the French-speaking world, and inspired many singers in the 1980s.", death_year: 1986, birth_year: 1952, user: user_3)
category_10.photo.attach(io: img_category_10, filename: 'Daniel_Balavoine.png', content_type: 'img/png')

category_11 = Singer.create!(name: "Elvis Presley", category: "rock", price: 500, bio: "American singer and actor. Dubbed the 'King of Rock and Roll', he is regarded as one of the most significant cultural icons of the 20th century.", death_year: 1977, birth_year: 1935, user: user_4)
category_11.photo.attach(io: img_category_11, filename: 'Elvis_Presley.png', content_type: 'img/png')

category_12 = Singer.create!(name: "Henri Salvador", category: "pop", price: 500, bio: "French Caribbean comedian, singer and cabaret artist.", death_year: 2008, birth_year: 1917, user: user_4)
category_12.photo.attach(io: img_category_12, filename: 'Henri_Salvador.png', content_type: 'img/png')


# seed rating

category_1.ratings << Rating.create(rating: 3, review: "plus de la balle que celles qu il a recu.")
category_4.ratings << Rating.create(rating: 4, review: "son live m'a fumé.")
category_9.ratings << Rating.create(rating: 1, review: "j'aime pas sa gueule.")
category_11.ratings << Rating.create(rating: 5, review: "le king porte bien son nom.")
category_8.ratings << Rating.create(rating: 1, review: "cette femme ne chante pas, elle gueule.")
