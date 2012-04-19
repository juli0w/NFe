class CreateCompanies < ActiveRecord::Migration
  def up
    create_table :companies do |t|
      t.string :name, :null => false
    end

    Company.create(:name => "Weekz")
  end

  def down
    drop_table :companies
  end
end
