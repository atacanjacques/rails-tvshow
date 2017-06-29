class CreateEpisodes < ActiveRecord::Migration[5.0]
  def change
    create_table :episodes do |t|
      t.integer :season
      t.integer :episode
      t.string :title
      t.belongs_to :tv_show, foreign_key: true

      t.timestamps
    end
  end
end
