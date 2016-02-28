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

  def funding_percent
 		current_funding = 0.0
 		self.pledges.each{|pledge| current_funding = pledge.dollar_amount}

 		funding_percent = (current_funding / self.funding_goal * 100).round(2)
 		"#{funding_percent}%"
 	end

end
