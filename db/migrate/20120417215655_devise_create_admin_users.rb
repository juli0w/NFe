class DeviseCreateAdminUsers < ActiveRecord::Migration
  def change
    create_table(:admin_users) do |t|
      ## Database authenticatable
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      t.references :company

      t.timestamps
    end

    # Create a default user
    AdminUser.create!(:email => 'admin@admin.com', :password => 'nfesistemas', :password_confirmation => 'nfesistemas')

    add_index :admin_users, :email,                :unique => true
    # add_index :admin_users, :confirmation_token,   :unique => true
    # add_index :admin_users, :unlock_token,         :unique => true
    # add_index :admin_users, :authentication_token, :unique => true
  end
end
