class Project < ActiveRecord::Base
  has_many :pledges
  has_many :pledging_users, through: :pledges, :class_name => "User"

  has_many :comments
  has_many :commenting_users, through: :comments, :class_name => "User"

  belongs_to :owner, :class_name => "User"
end
