class CreateRights < ActiveRecord::Migration
  def up
    create_table :rights, :id => false do |t|
      t.references :admin_user
      t.references :role
    end
  end

  def down
    drop_table :rights
  end
end
