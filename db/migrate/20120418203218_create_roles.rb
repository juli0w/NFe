class CreateRoles < ActiveRecord::Migration
  def up
    create_table :roles do |t|
      t.string :name, :null => false
    end

    Role.create(:name => "Moderator")
    Role.create(:name => "Admin")
  end

  def down
    drop_table :roles
  end
end
