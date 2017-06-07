class CreateTvShows < ActiveRecord::Migration[5.0]
  def change
    create_table :tv_shows do |t|
      t.string :nom
      t.integer :statut
      t.integer :duree

      t.timestamps
    end
  end
end
