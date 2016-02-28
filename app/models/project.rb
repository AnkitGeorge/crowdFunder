class Project < ActiveRecord::Base
  has_many :pledges
  has_many :pledging_users, through: :pledges, :source => :user
  has_many :comments
  has_many :commenting_users, through: :comments, :source => :user
  has_many :rewards

  belongs_to :owner, :class_name => "User"

  validates :title, :funding_goal, :project_end_date, presence: true
  validates :title, uniqueness: true
  # validates :project_end_date, numericality: {greater_than: Time.now.to_i}
  # figure out a way to validate the project end date so it's greater than current time
  validates :funding_goal, numericality: {only_integer: true, greater_than: 0}

end
