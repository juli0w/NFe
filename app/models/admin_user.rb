class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :rememberable, :validatable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :company_id
  # attr_accessible :title, :body

  has_and_belongs_to_many :roles, :join_table => "rights"
  belongs_to :company

  scope :admins, joins(:roles).where(["roles.name = ?", 'Admin'])
  scope :moderators, joins(:roles).where(["roles.name = ?", 'Moderator'])

  def admin?
    roles.include? Role.admin
  end

  def moderator?
    roles.include? Role.moderator
  end
end
