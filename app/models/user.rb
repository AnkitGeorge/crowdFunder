class User < ActiveRecord::Base

  authenticates_with_sorcery!
  has_many :comments
  has_many :pledges
  has_many :pledged_projects, through: :pledges, :source => :project
  has_many :owned_projects, :class_name => "Project", :foreign_key => :owner_id

  validates :username, uniqueness: true
  validates :password, length: { minimum: 5 }, if: -> { new_record? || changes["password"] }
  validates :password, confirmation: true, if: -> { new_record? || changes["password"] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes["password"] }

  validates :email, uniqueness: true

end
