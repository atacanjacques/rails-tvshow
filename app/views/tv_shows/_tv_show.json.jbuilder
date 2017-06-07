json.extract! tv_show, :id, :nom, :statut, :duree, :created_at, :updated_at
json.url tv_show_url(tv_show, format: :json)
