class TvShow < ApplicationRecord
  belongs_to :channel, optional: true

  has_many :episodes

  has_many :tv_show_genre
  has_many :genres, through: :tv_show_genre

  has_many :user_tv_show
  has_many :users, through: :user_tv_show

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end
end
