module TvShowsHelper
	def tv_show_status_label(status)
		if status == 0
			raw '<span class="label label-danger">Terminé</span>'
		elsif status == 1
			raw '<span class="label label-success">En cours</span>'
		elsif status == 2
			raw '<span class="label label-warning">Annulé</span>'
		end
	end
end