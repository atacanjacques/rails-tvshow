class TvShow < ApplicationRecord
	belongs_to :channel, optional: true
end
