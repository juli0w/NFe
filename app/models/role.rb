class Role < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => "rights"

  attr_accessible :name

  def self.admin
    where(:name => "Admin").first
  end

  def self.moderator
    where(:name => "Moderator").first
  end
end
