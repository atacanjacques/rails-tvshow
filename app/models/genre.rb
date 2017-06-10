class Genre < ApplicationRecord
	has_many :tv_show_genre
	has_many :tv_show, through: :tv_show_genre
end
