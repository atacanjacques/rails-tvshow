class RenameColumnsToEnglish < ActiveRecord::Migration[5.0]
  def change
  	rename_column :channels, :nom, :name
  	rename_column :episodes, :saison, :season
  	rename_column :episodes, :titre, :title
  	rename_column :genres, :nom, :name
  	rename_column :tv_shows, :nom, :name
  	rename_column :tv_shows, :statut, :status
  	rename_column :tv_shows, :duree, :time
  end
end
