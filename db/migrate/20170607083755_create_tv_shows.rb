class CreateTvShows < ActiveRecord::Migration[5.0]
  def change
    create_table :tv_shows do |t|
      t.string :name
      t.integer :status
      t.integer :time

      t.timestamps
    end
  end
end
