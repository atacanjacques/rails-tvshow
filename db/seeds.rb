# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Channel.create(name: 'AMC')
Channel.create(name: 'HBO')
Channel.create(name: 'Canal+')

Genre.create(name: 'Comédie')
Genre.create(name: 'Action')
Genre.create(name: 'Documentaire')
Genre.create(name: 'Drame')

TvShow.create(name: 'Les simpsons', status: 1, time: 25, channel_id: 1, genre_ids: [1])
TvShow.create(name: 'Hannibal', status: 2, time: 60, channel_id: 2, genre_ids: [2, 4])
TvShow.create(name: 'Futurama', status: 0, time: 30, channel_id: 3, genre_ids: [1,3])

Episode.create(season: 1, episode: 1, title: "Simpsons Roasting on an Open Fire", tv_show_id: 1)
Episode.create(season: 1, episode: 2, title: "Bart the Genius", tv_show_id: 1)
Episode.create(season: 1, episode: 1, title: "Apéritif", tv_show_id: 2)
Episode.create(season: 1, episode: 3, title: "Homer's Odyssey", tv_show_id: 1)
Episode.create(season: 1, episode: 1, title: "Space Pilot 3000", tv_show_id: 3)

User.create!(email: 'admin@admin.admin', password: 'admin@admin.admin', password_confirmation: 'admin@admin.admin')