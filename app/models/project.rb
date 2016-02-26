class Project < ActiveRecord::Base
  has_many :pledges
  has_many :pledging_users, through: :pledges, :source => "User"

  has_many :comments
  has_many :commenting_users, through: :comments, :source => "User"

  belongs_to :owner, :class_name => "User"
end
