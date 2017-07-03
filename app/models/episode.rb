class Episode < ApplicationRecord
  belongs_to :tv_show

  has_many :user_episode
  has_many :users, through: :user_episode
end
