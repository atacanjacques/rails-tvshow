class Genre < ApplicationRecord
  has_many :tv_show_genre
  has_many :tv_shows, through: :tv_show_genre

  validates :name, presence: true
end
