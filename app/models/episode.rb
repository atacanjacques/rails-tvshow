class Episode < ApplicationRecord
  belongs_to :tv_show

  has_many :user_episode
  has_many :users, through: :user_episode

  validates :season, presence: true
  validates :episode, presence: true
  validates :title,  presence: true
  validates :tv_show_id,  presence: true
end
