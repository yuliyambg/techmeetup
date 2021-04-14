# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


meetup1 = Meetup.create(title: "ruby", date_time: "2021-03-31 10:20:00.000000000 +0000", description: "new ruby meetup", image_url: "https://images.unsplash.com/photo-1519389950473-47...", link: "examplelink")
meetup2 = Meetup.create(title: "rails", date_time: "2021-03-31 10:20:00.000000000 +0000", description: "rails meetup", image_url: "https://images.unsplash.com/photo-1588196749597-9f...", link: "examplelink2")
meetup3 = Meetup.create(title: "JS", date_time: "2021-04-01 11:27:00.000000000 +0000", description: "Javascript", image_url: "https://images.unsplash.com/photo-1606770347238-77...", link: "examplelink3")

user1 = User.create(first_name: "yuliya", last_name: "marinova", email: "artconstraction1@yahoo.com", password: "password")
meetup1.comments.create(content: "great ruby meetup", user_id: user1.id)
meetup2.comments.create(content: "great rails meetup", user_id: user1.id)
meetup3.comments.create(content: "great JS meetup", user_id: user1.id)