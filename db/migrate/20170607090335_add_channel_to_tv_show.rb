class AddChannelToTvShow < ActiveRecord::Migration[5.0]
  def change
    add_reference :tv_shows, :channel, foreign_key: true
  end
end
