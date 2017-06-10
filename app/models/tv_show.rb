class TvShow < ApplicationRecord
	belongs_to :channel, optional: true
	has_many :episodes
	has_many :tv_show_genre
	has_many :genres, through: :tv_show_genre
end
