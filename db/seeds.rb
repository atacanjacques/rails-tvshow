Channel.create(name: 'BBC One')
Channel.create(name: 'Comedy Central (US)')
Channel.create(name: 'AMC')
Channel.create(name: 'FOX (US)')
Channel.create(name: 'BBC America')
Channel.create(name: 'E4')
Channel.create(name: 'Channel 4')
Channel.create(name: 'AMC')
Channel.create(name: 'NBC')

Genre.create(name: 'Crime')
Genre.create(name: 'Drama')
Genre.create(name: 'Animation')
Genre.create(name: 'Comédie')
Genre.create(name: 'Thriller')
Genre.create(name: 'Action')
Genre.create(name: 'Drama')
Genre.create(name: 'Science-fiction')
Genre.create(name: 'Aventure')
Genre.create(name: 'Horreur')

TvShow.create(name: 'The Simpsons', status: 1, time: 25, channel_id: 4, genre_ids: [3, 4])
TvShow.create(name: 'Hannibal', status: 2, time: 45, channel_id: 9, genre_ids: [1, 2 ,10])
TvShow.create(name: 'Futurama', status: 0, time: 20, channel_id: 2, genre_ids: [3, 4, 8])
TvShow.create(name: 'Sherlock', status: 1, time: 90, channel_id: 1, genre_ids: [1, 2])
TvShow.create(name: 'South Park', status: 1, time: 25, channel_id: 2, genre_ids: [3, 4])
TvShow.create(name: 'Breaking Bad', status: 0, time: 45, channel_id: 3, genre_ids: [1, 2, 4])
TvShow.create(name: 'Brooklyn Nine-Nine', status: 1, time: 25, channel_id: 4, genre_ids: [1, 4, 6])
TvShow.create(name: 'Orphan Black', status: 1, time: 45, channel_id: 5, genre_ids: [2, 6, 8])
TvShow.create(name: 'Misfits', status: 0, time: 60, channel_id: 6, genre_ids: [2, 4, 8])
TvShow.create(name: 'Doctor Who (2005)', status: 1, time: 45, channel_id: 1, genre_ids: [2, 8, 9])
TvShow.create(name: 'The IT Crowd', status: 0, time: 25, channel_id: 7, genre_ids: [4])

Episode.create(season: 1, episode: 1, title: "Simpsons Roasting on an Open Fire", tv_show_id: 1)
Episode.create(season: 1, episode: 2, title: "Bart the Genius", tv_show_id: 1)
Episode.create(season: 1, episode: 1, title: "Apéritif", tv_show_id: 2)
Episode.create(season: 1, episode: 3, title: "Homer's Odyssey", tv_show_id: 1)
Episode.create(season: 1, episode: 1, title: "Space Pilot 3000", tv_show_id: 3)

User.create!(email: 'admin@admin.admin',username: 'jean-admin', password: 'admin@admin.admin', password_confirmation: 'admin@admin.admin')
.add_role :admin
User.create!(email: 'user@user.user',username: 'michel75002', password: 'user@user.user', password_confirmation: 'user@user.user')
