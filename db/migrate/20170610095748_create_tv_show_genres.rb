class CreateTvShowGenres < ActiveRecord::Migration[5.0]
  def change
    create_table :tv_show_genres do |t|
      t.references :tv_show, foreign_key: true
      t.references :genre, foreign_key: true

      t.timestamps
    end
  end
end
