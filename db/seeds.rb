# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Singer.destroy_all
User.destroy_all

user_1 = User.create!(first_name: "clement", last_name: "guidet", email: "c.guidet@lesang.com", password: "123456", password_confirmation: "123456")
user_2 = User.create!(first_name: "eric", last_name: "zarazir", email: "e.zarazir@lesang.com", password: "123456", password_confirmation: "123456")
user_3 = User.create!(first_name: "leandro", last_name: "barbosa", email: "l.barbosa@lesang.com", password: "123456", password_confirmation: "123456")
user_4 = User.create!(first_name: "thibault", last_name: "brianceau", email: "t.brianceau@lesang.com", password: "123456", password_confirmation: "123456")

Singer.create!(name: "2pac", category: "rap", price: 500, bio: "Considered one of the most influential rappers of all time, from new york east coast", death_year: 1996, birth_year: 1971, user: user_1)
Singer.create!(name: "Jim Morrison", category: "rock", price: 500, bio: "American singer, poet and songwriter who was the lead vocalist of the rock band the Doors.", death_year: 1971, birth_year: 1943, user: user_2)
Singer.create!(name: "Jimi Hendrix", category: "rock", price: 500, bio: "American musician, singer, and songwriter. Considered one of the most influential guitar Hero of all time", death_year: 1970, birth_year: 1942, user: user_3)
Singer.create!(name: "Bob Marley", category: "reggae", price: 500, bio: "Jamaican singer, songwriter, and musician. Considered one of the pioneers of reggae", death_year: 1981, birth_year: 1945, user: user_4)
Singer.create!(name: "Kurt Cobain", category: "rock", price: 500, bio: "American singer, songwriter, artist and musician. He was the frontman of the rock band Nirvana.", death_year: 1994, birth_year: 1967, user: user_1)
Singer.create!(name: "Lil Peep", category: "rap", price: 500, bio: "Swedish-American rapper, singer, and songwriter. He was a member of the emo rap collective GothBoiClique.", death_year: 2017, birth_year: 1996, user: user_2)
Singer.create!(name: "Serge Gainsbourg", category: "pop", price: 500, bio: "French musician, singer-songwriter, actor, author and filmmaker. Regarded as one of the most important figures in French pop.", death_year: 1991, birth_year: 1928, user: user_3)
Singer.create!(name: "Janis Joplin", category: "rock", price: 500, bio: "American singer-songwriter who sang rock, soul, and blues music. One of the most successful and widely known rock stars of her era", death_year: 1970, birth_year: 1943, user: user_4)
Singer.create!(name: "Johnny Hallyday", category: "rock", price: 500, bio: "French rock and roll and pop singer and actor, credited for having brought rock and roll to France.", death_year: 2017, birth_year: 1943, user: user_3)
Singer.create!(name: "Daniel Balavoine", category: "pop", price: 500, bio: " French singer and songwriter. He was hugely popular in the French-speaking world, and inspired many singers in the 1980s.", death_year: 1986, birth_year: 1952, user: user_3)
Singer.create!(name: "Elvis Presley", category: "rock", price: 500, bio: "American singer and actor. Dubbed the 'King of Rock and Roll', he is regarded as one of the most significant cultural icons of the 20th century.", death_year: 1977, birth_year: 1935, user: user_4)
