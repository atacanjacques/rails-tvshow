class CreateUserEpisodes < ActiveRecord::Migration[5.0]
  def change
    create_table :user_episodes do |t|
      t.references :user, foreign_key: true
      t.references :episode, foreign_key: true

      t.timestamps
    end
  end
end
