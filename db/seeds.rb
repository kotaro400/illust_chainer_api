# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Picture.destroy_all
Chain.destroy_all

chain = Chain.create()
picture = chain.pictures.create(name: "りんご", order: 1)
picture.image.attach(io: File.open("#{Rails.root}/tmp/apple_logo.png"), filename: "apple.png", content_type: "image/png")