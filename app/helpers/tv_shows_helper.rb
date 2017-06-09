module TvShowsHelper
	def tv_show_statut_label(statut)
		if statut == 0
			raw '<span class="label label-danger">Terminé</span>'
			elsif statut == 1
			raw '<span class="label label-success">En cours</span>'
			elsif statut == 2
			raw '<span class="label label-warning">Annulé</span>'
		end
	end
end
