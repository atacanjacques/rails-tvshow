class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_many :user_tv_show
  has_many :tv_shows, through: :user_tv_show

  has_many :user_episode
  has_many :episodes, through: :user_episode
end
