class TvShow < ApplicationRecord
	belongs_to :channel, optional: true
	has_many :episodes
end
