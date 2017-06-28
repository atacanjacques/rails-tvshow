class CreateEpisodes < ActiveRecord::Migration[5.0]
  def change
    create_table :episodes do |t|
      t.integer :saison
      t.integer :episode
      t.string :titre
      t.belongs_to :tv_show, foreign_key: true

      t.timestamps
    end
  end
end
