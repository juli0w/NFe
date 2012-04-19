ActiveAdmin.register Company do
  menu :if => proc { current_admin_user.admin? }, :label => "Empresas", :parent => "Restrito", :priority => 2

  filter :name, :label => "Nome"
end
