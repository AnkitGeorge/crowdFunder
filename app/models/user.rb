class User < ActiveRecord::Base

  authenticates_with_sorcery!
  has_many :comments
  has_many :pledges
  has_many :pledged_projects, through: :pledges, :class_name => "Project"
  has_many :owned_projects, :class_name => "Project"

end
