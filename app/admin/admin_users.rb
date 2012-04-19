ActiveAdmin.register AdminUser do
  menu :if => proc { current_admin_user.admin? }, :label => "Clientes", :parent => "Restrito", :priority => 1

  scope :all, :default => true
  scope :administradores, :admins
  scope :moderadores, :moderators

  filter :company, :label => "Empresa"
  filter :email

  index do
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  form do |f|
    f.inputs "Detalhes do cliente" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :company
    end
    f.buttons
  end

end
