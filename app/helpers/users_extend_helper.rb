module UsersExtendHelper
  def users_extend_role_label(role)
    if role == "simple_user"
      raw '<span class="label label-primary">Utilisateur</span>'
    elsif role == "admin"
      raw '<span class="label label-danger">Administrateur</span>'
    end
  end
end
